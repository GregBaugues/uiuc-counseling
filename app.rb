require 'sinatra'

post '/message' do
  content_type "text/xml"

  "<Response>
    <Message>
      You're signed up to get a wake up call that will connect you to the counseling center.
    </Message>
  </Response>"

end