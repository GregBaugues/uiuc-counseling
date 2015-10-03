require 'sinatra'

post '/forward-call' do
  content_type "text/xml"

  "<Response>
    <Dial>+12172473048</Dial>
  </Response>"
end

post '/message' do
  phone_number = params['From']
  body = params['Body']

  content_type "text/xml"

  if body.downcase.include?('unsubscribe')
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
  make_numbers_dir_if_it_doesnt_exist
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

def make_numbers_dir_if_it_doesnt_exist
  unless Dir.exists?("numbers")
    Dir.mkdir(File.join("numbers"))
  end
end