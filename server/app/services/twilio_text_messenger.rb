class TwilioTextMessenger
    def initialize(message)
        @message = message
    end

    def send
        client = Twilio::REST::Client.new
        client.messages.create({
            from: ENV['TWILIO_PHONE_NUMBER'],
            to: ENV['BAGELS_SMS_NOTIFICATION_NUMBER']
            body: @message
        })
    end
end