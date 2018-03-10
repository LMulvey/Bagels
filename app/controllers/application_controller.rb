class ApplicationController < ActionController::API
    include ActionController::Serialization
    include ActionController::Helpers
    
    private
    def generate_response(options = {})
        message = options[:message]
        type = options[:type]
        record = options[:record]

        if message.blank?
            response_caller = caller_locations(1,1)[0].label
            response_caller = response_caller.chop if response_caller.end_with? 'e'

            message = "#{record.class.name} "
            if type === :success
                message += "successfully #{response_caller}ed!"
            else
                message += "could not be #{response_caller}ed! "
                message += "ERROR: #{record.errors.full_messages.join(', Err:')}"
            end
        end
        error_bool = type === :success ? false : true
        
        { :error => error_bool, :message => message, :record => record }
    end
    helper_method :generate_response
end
