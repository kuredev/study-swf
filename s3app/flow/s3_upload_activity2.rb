require 'aws/decider'
require 'aws-sdk-s3'


class S3UploadActivity2
  extend AWS::Flow::Activities

  activity :upload2 do
    {
        version: "1.0"
    }
  end

  def upload2(bucket_name, saved_object_name, upload_object_name)
    p "S3UploadActivity2#upload2"
    resource = Aws::S3::Resource.new(
        region: "ap-northeast-1"
    )
    obj = resource.bucket(bucket_name).object(upload_object_name)
    obj.upload_file(saved_object_name)
  end
end



