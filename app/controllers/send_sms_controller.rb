class SendSmsController < ApplicationController
  
  def index 
      message_body = params["Body"]
      from_number = params["From"]

      SMSLogger.log_text_message from_number, message_body
      
      client = Twilio::REST::Client.new(ENV['twiliosid'], ENV['twiliotoken'])

      client.account.sms.messages.create(
        :from => ENV['twiliofrom'],
        :to => from_number,
        :body => "Message body"
      )
      
    end 
end