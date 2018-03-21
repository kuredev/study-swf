require 'aws/decider'
require './s3_download_activity'
require './s3_upload_activity'
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
    client.download4(options[:bucket_name], options[:object_name], options[:saved_object_name])
    client2.upload2(options[:bucket_name], options[:saved_object_name], options[:upload_object_name])
  end
end

swf = AWS::SimpleWorkflow.new
domain = swf.domains["Booking3"]

# デシジョンタスクリスト
# 「DecisionTaskStarted」イベントが開始される
workflow_worker = AWS::Flow::WorkflowWorker.new(
    swf.client, domain, "s3-decition-task-list", S3AppWorkFlow)
workflow_worker.start(true)

