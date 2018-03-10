module Api
    class TicketsController < ApplicationController
        public
            def index
                @tickets = Ticket.where(nil)
                @tickets = @tickets.where(driver_id: nil) if params[:unassigned].present?
                render json: @tickets
            end

            def show
                if params[:driver_id]
                    @tickets = Ticket.where(driver_id: params[:driver_id])
                elsif params[:event_id]
                    @event = Event.find_by(id: params[:event_id])
                    @tickets = Ticket.find_by(id: @event[:ticket_id])
                else
                    @tickets = Ticket.find_by(id: params[:id])
                end
                render json: @tickets
            end

            def create
                @ticket = Ticket.new(create_params)
                @ticket[:status] = "active" if !@ticket[:status]
                
                if @ticket.save
                    @result = :success
                else
                    @result = :error
                end
                render json: generate_response(record: @ticket, type: @result)
            end

            def update
                @ticket = Ticket.find_by(id: params[:id])
                if !@ticket
                    render json: generate_response(record: @ticket, type: :error, message: 'Could not find Ticket. Check ID.') 
                else
                    # If we're inputting a stop time and change status to completed if so.
                    if create_params.has_key?(:stop_time) && @ticket[:start_time]
                        @ticket[:status] = "completed"
                    end

                    if @ticket.update(create_params)
                        @result = :success
                    else
                        @result = :error
                    end
                    render json: generate_response(record: @ticket, type: @result)
                end
            end

            def destroy
                @ticket = Ticket.find_by(id: params[:id])
                if !@ticket
                    render json: generate_response(record: @ticket, type: :error, message: 'Could not find Ticket. Check ID.') 
                else
                    if @ticket.destroy!
                        @result = :success
                    else
                        @result = :error
                    end
                    render json: generate_response(record: @ticket, type: @result)
                    
                end
            end
        
        private
            def create_params
                params.require(:ticket)
                .permit(:driver_id, :status, :start_time, :stop_time, :description)
            end
    end
end