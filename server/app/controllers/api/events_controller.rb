module Api
    class EventsController < ApplicationController
        public

        def index
            @events = Event.where(nil)
            @result = !@events ? :success : :error

            render json: generate_response(record: @events, type: @result)
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
            if !@event
                render json: generate_response(record: @event, type: :error, message: 'Could not find Event. Check ID.') 
            else
                # If we're inputting a stop time and change status to completed while we're at it.
                # Is this a side-effect that we should avoid? Handle this in the client logic?
                if update_params.has_key?(:stop_time) && @event[:start_time]
                    @event[:status] = "completed"
                end

                if @event.update(update_params)
                    @result = :success
                else
                    @result = :error
                end
                render json: generate_response(record: @event, type: @result)                
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
            .permit(:ticket_id, :status, :type, :start_time, :stop_time, :description, :measurement, :measurement_type)
        end
        def update_params
            params.require(:event)
            .permit(:status, :type, :start_time, :stop_time, :description, :measurement, :measurement_type)
        end
    end
end
