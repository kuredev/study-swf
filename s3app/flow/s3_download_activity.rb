require 'aws/decider'
require 'aws-sdk-s3'

class S3DownloadActivity
  extend AWS::Flow::Activities

  activity  :download4 do
    {
        version: "1.0"
    }
  end
  def download4(bucket_name, object_name, saved_object_name)
 # def download4
    p "download4"
    p bucket_name
    p object_name
    p saved_object_name
    resource = Aws::S3::Resource.new(
        region: "ap-northeast-1"
    )
#    obj = resource.bucket("swf.kuredev.info").object("test_image.jpg")
    obj = resource.bucket(bucket_name).object(object_name)
    obj.download_file(saved_object_name)
  end
end