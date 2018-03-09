module Api
    class EventsController < ApplicationController
        public

            def index
                render json: Event.all
            end

            def create
            end

            def update
            end

        private

            def create_params
                params.require(:event)
                .permit(:ticket_id, :description, :type, :address, :status)
            end
    end
end
