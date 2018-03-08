require_relative '../util'

# You can require your activity files here.
class MyMailActivities
  extend AWS::Flow::Activities

  activity  :send_mail1, :send_mail2, :send_mail3 do
    {
      version: "1.0"
    }
  end

  def send_mail1()
    p "send_mail1"
    send_mail('send_mail1')
  end

  def send_mail2()
    p "send_mail2"
    send_mail('send_mail2')
  end

  def send_mail3()
    p "send_mail3"
    send_mail('send_mail3')
  end
end
