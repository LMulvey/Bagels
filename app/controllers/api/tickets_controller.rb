module Api
    class TicketsController < ApplicationController
        public
            def index
                render json: Ticket.all
            end

            def show
                @ticket = Ticket.find(params[:id])
                render json: @ticket
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