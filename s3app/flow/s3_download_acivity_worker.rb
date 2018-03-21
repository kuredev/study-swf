require 'aws/decider'
require '../flow/s3_download_activity'

swf = AWS::SimpleWorkflow.new
domain = swf.domains["Booking3"]
# アクティビティタスクリスト
active_worker = AWS::Flow::ActivityWorker.new(
    domain.client, domain, "s3-activity-task-list", S3DownloadActivity)
active_worker.start(false)



