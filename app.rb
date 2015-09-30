require 'sinatra'
require 'pry'

post '/message' do
  content_type "text/xml"

  save_number(params['From'])

  "<Response>
    <Message>
      You're signed up to get a wake up call that will connect you to the counseling center.
    </Message>
  </Response>"

end

def save_number(phone_number)
  filename = "numbers/#{phone_number}"
  File.open(filename, "w") { |f| }
end

binding.pry