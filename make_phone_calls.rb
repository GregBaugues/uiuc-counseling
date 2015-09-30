require 'twilio-ruby'

def twilio_client
  Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
end

def call(phone_number)
  twilio_client.calls.create(
    to: phone_number,
    from: "+12172366087",
    url: "http://baugues.ngrok.com/forward-call"
  )
end

call('+13129526796')

