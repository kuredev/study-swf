require 'aws/decider'
require 'dotenv'

# Exectionする方法は2通り
# https://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/programming-start-workflow-execution.html
# ① start_workflowを使う　Bookingサンプルはこっち
# ② WorkflowClientを使う　FileProcessingサンプルはこっち

########
# ① start_workflowを使う
# 前提：ドメインとワークフロータイプが作成済み
Dotenv.load
p ENV['BUCKET_NAME']

input = {
#    bucket_name: "swf.kuredev.info",
    bucket_name: ENV['BUCKET_NAME'],
    object_name: "test_image.jpg",
    saved_object_name: "./test_image2.jpg",
    upload_object_name: "test_image2.jpg"
}

opts = {
    domain: "Booking3",
    version: "1.0",
    execution_method: "s3app",
    execution_start_to_close_timeout: 60,
    task_start_to_close_timeout: 60
}

# WorkFlow名、INPUT、オプション
## 指定のWorkFlow Typeを事前に作成しておかないとエラーになる
### ワークフロータイプ： s3app-workflow.download_from_s3
AWS::Flow::start_workflow("S3AppWorkFlow", input, opts)


#######
# ② WorkflowClientを使う


