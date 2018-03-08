require 'aws/decider'

p "start!"

AWS::Flow::start_workflow(
    "MyMailWorkFlow.send_mails",
    {
    },
    {
        version: "1.0",
        domain: "MyMail"
    }
)