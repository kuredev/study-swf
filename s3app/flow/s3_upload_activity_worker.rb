require 'aws/decider'
require '../flow/s3_upload_activity'

swf = AWS::SimpleWorkflow.new
domain = swf.domains["Booking3"]
# アクティビティタスクリスト
active_worker = AWS::Flow::ActivityWorker.new(
    domain.client, domain, "s3-activity-task-list2", S3UploadActivity)
active_worker.start(false)



