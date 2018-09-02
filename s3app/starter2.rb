require 'aws/decider'
require 'dotenv'
require 'aws-sdk'
require_relative './flow/s3app_workflow_worker'
Dotenv.load

# Exectionする方法は2通り
# https://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/programming-start-workflow-execution.html
# ① start_workflowを使う　Bookingサンプルはこっち
# ② WorkflowClientを使う　FileProcessingサンプルはこっち

#######X
# ② WorkflowClientを使うX
X
input = {
    bucket_name: ENV['BUCKET_NAME'],
    object_name: "test_image.jpg", # S3にあるファイル名
    saved_object_name: "./test_image3.jpg",
    upload_object_name: "test_image2.jpg",
    upload_object_name2: "test_image3.jpg"
}

swf = AWS::SimpleWorkflow.new
domain = swf.domains['Booking3']
workflow_client = AWS::Flow::workflow_client(swf.client, domain){ {from_class: "S3AppWorkFlow" }}
workflow_client.start_execution(input)
