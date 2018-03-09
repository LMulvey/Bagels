module Api
    class TicketsController < ApplicationController
        public
            def index
                render json: Ticket.all
            end

            def create
            end
        
        private
            def create_params
                params.require(:ticket)
                .permit(:driver_id, :status)
            end
    end
end