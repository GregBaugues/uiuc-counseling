require 'twilio-ruby'
require 'pry'

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

def phone_numbers
  files = Dir.entries("numbers")
  files.delete(".")
  files.delete("..")
  files # equivalent to the phone numbers that have subscribed
end

phone_numbers.each do |phone_number|
  call(phone_number)
end

