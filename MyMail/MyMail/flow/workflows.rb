# You can require your workflow files here.

class MyMailWorkFlow
  extend AWS::Flow::Workflows

  workflow :send_mails do
    {
        version: "1.0",
        default_execution_start_to_close_timeout: 120
    }
  end

  activity_client(:client) { { from_class: "MyMailActivities" } }

  def send_mails(options)
    p "send_mails"
    client.send_mail1()
    client.send_mail2()
    client.send_mail3()
  end

end

