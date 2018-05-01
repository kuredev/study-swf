require 'aws/decider'
require './s3_download_activity'
require './s3_upload_activity'
require './s3_upload_activity2'
require 'bundler/setup'

class S3AppWorkFlow
  extend AWS::Flow::Workflows

  # ワークフローのエントリポイント: s3app
  workflow :s3app do
    {
        version: "1.0", # ワークフローのVersion
        default_execution_start_to_close_timeout: 120
    }
  end

  activity_client(:client){ { from_class: "S3DownloadActivity"} }
  activity_client(:client2){ { from_class: "S3UploadActivity"} }
#  activity_client(:s3_upload_client){{from_class: "S3UploadActivity"}}
#  activity_client(:file_resize_client){{from_class: "FileResizeActivity"}}

  def s3app(options)
    p "S3AppWorkFlow#s3app"
    client.download4(options[:bucket_name], options[:object_name], options[:saved_object_name])
    client2.upload2(options[:bucket_name], options[:saved_object_name], options[:upload_object_name])
  end
end

class S3AppWorkFlow2
  extend AWS::Flow::Workflows

  # ワークフローのエントリポイント: s3app
  workflow :s3app do
    {
        version: "1.0", # ワークフローのVersion
        default_execution_start_to_close_timeout: 120
    }
  end

  activity_client(:client){ { from_class: "S3DownloadActivity"} }
  activity_client(:client3){ { from_class: "S3UploadActivity2"} }

  def s3app(options)
    p "S3AppWorkFlow2#1"
    client.download4(options[:bucket_name], options[:object_name], options[:saved_object_name])
    p "S3AppWorkFlow2#2"
    client3.upload2(options[:bucket_name], options[:saved_object_name], options[:upload_object_name2])
    p "S3AppWorkFlow2#3"
  end
end


swf = AWS::SimpleWorkflow.new
domain = swf.domains["Booking3"]

# デシジョンタスクリスト
# 「DecisionTaskStarted」イベントが開始される
workflow_worker = AWS::Flow::WorkflowWorker.new(
    swf.client, domain, "s3-decition-task-list", *[S3AppWorkFlow2, S3AppWorkFlow])
workflow_worker.start(true)

