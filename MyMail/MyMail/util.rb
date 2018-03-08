require 'aws-sdk-sns'
require 'dotenv'

def send_mail(msg)
  Dotenv.load
  sns = Aws::SNS::Resource.new(region: 'ap-northeast-1')
  topic = sns.topic(ENV['TOPIC_ARN'])
  topic.publish({message: msg})
end