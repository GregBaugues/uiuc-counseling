require 'sinatra'
require 'pry'
require 'pp'

post '/message' do
  pp params

  phone_number = params['From']
  body = params['Body']

  content_type "text/xml"

  if body.downcase.include?('stop')
    unsubscribe(phone_number)
  else
    sign_up(phone_number)
  end
end

def sign_up(phone_number)
  save_phone_number(phone_number)

  "<Response>
    <Message>
      You're signed up to get a wake up call that will connect you to the counseling center.
    </Message>
  </Response>"
end

def unsubscribe(phone_number)
  delete_phone_number(phone_number)

  "<Response>
    <Message>
      You've been removed from the list.
    </Message>
  </Response>"
end

def save_phone_number(phone_number)
  File.open(filename(phone_number), "w") { |f| }
end

def delete_phone_number(phone_number)
  begin
    File.delete(filename(phone_number))
  rescue
    "File #{filename(phone_number)} doesn't exist"
  end
end

def filename(phone_number)
  "numbers/#{phone_number}"
end