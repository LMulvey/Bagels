module Api
    class TicketsController < ApplicationController
        public
            def index
                render json: Ticket.all
            end

            def show
                if params[:driver_id]
                    @tickets = Ticket.where driver_id: params[:driver_id]
                    render json: @tickets
                else
                    @ticket = Ticket.find(params[:id])
                    render json: @ticket
                end
            end

            def create
                @ticket = Ticket.new(ticket_params)
                if @ticket.save
                    render json: generate_response(record: @ticket, type: :success)
                else
                    render json: generate_response(record: @ticket, type: :error)
                end
            end

            def update
                @ticket = Ticket.find_by id: params[:id]
                if !@ticket
                    render json: generate_response(record: @ticket, type: :error, message: 'Could not find Ticket. Check ID.') 
                else
                    # If we're inputting a stop time and change status to completed if so.
                    if ticket_params.has_key?(:stop_time) && @ticket[:start_time]
                        @ticket[:status] = "completed"
                    end

                    if @ticket.update(ticket_params)
                        render json: generate_response(record: @ticket, type: :success)
                    else
                        render json: generate_response(record: @ticket, type: :error)
                    end
                end
            end
        
        private
            def ticket_params
                params.require(:ticket)
                .permit(:driver_id, :status, :start_time, :stop_time, :description)
            end
    end
end