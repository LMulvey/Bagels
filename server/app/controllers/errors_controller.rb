class ErrorsController < ActionController::Base
    def not_found
        render(:status => 400)
    end

    def server_error
        render(:status => 500)
    end
end