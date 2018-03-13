module Api
    class EventsController < ApplicationController
        public
            def index
                @events = Event.where(nil)
                render json: @events
            end

            def show
                @event = Event.find_by(id: params[:id])
                if !@event
                    @result = :error
                    @msg = 'Could not locate Event by ID. Check that it exists.'
                else
                    @result = :success
                end
                render json: generate_response(record: @event, type: @result, message: @msg)
            end

            def create
                @event = Event.new(create_params)
                @event[:status] = "active" if !@event[:status]

                if @event.save
                    @result = :success
                else
                    @result = :error
                end
                render json: generate_response(record: @event, type: @result)
                
            end

            def update
                @event = Event.find_by(id: params[:id])
                @current_params = update_params
                if !@event
                    render json: generate_response(record: @event, type: :error, message: 'Could not find Event. Check ID.') 
                else
                    # Is this a 'start' event? Mark the start_time in the ticket.
                    if @event[:event_type] === "start" && @current_params.has_key?(:start_time)
                        @ticketUpdate = {
                            :start_time => @current_params[:start_time]
                        }
                    end
                    
                    # Is this a 'stop' event? Handle marking the ticket as 'completed'
                    if @event[:event_type] === "stop" && @current_params.has_key?(:start_time)
                        @ticketUpdate = {
                            :status => "completed",
                            :completed_time => @current_params[:start_time]
                        }
                    end

                    # If we're updating the ticket, do it first. Then we'll move onto the event update.
                    if @ticketUpdate
                        @event.ticket.update(@ticketUpdate)
                        time_worked = (@event.ticket[:completed_time] - @event.ticket[:start_time]) / 1.hours
                        smsMessage = "Ticket ##{@event.ticket.id} has been completed. "
                        smsMessage += "Total hours worked: #{time_worked}"
                        TwilioTextMessenger.new(smsMessage).send
                    end

                    if(@event.ticket.errors.any?)
                        render json: generate_response(record: @event.ticket, type: @result) 
                    else 
                        if @event.update(@current_params)
                            @result = :success
                        else
                            @result = :error
                        end
                        render json: generate_response(record: @event, type: @result)     
                    end           
                end
            end

            def destroy
                @event = Event.find_by(id: params[:id])
                if !@event
                    render json: generate_response(record: @event, type: :error, message: 'Could not find Event. Check ID.') 
                else
                    if @event.destroy!
                        @result = :success
                    else
                        @result = :error
                    end
                    render json: generate_response(record: @event, type: @result)
                    
                end
            end
    
    
    private
        def create_params
            params.require(:event)
            .permit(:ticket_id, :event_type, :start_time, :description, :measurement, :measurement_type)
        end

        def update_params
            params.require(:event)
            .permit(:event_type, :start_time, :description, :measurement, :measurement_type)
        end
    end
end
