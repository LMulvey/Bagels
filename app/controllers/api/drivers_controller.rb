module Api
    class DriversController < ApplicationController
    # TODO: Build out auth for drivers - password, further contact details
    # Seems out of scope for this assignment. Get to it if everything else
    # is done rather quickly?
    
        public
            def index
                render json: Driver.all
            end

            def create
            end

        private
            def driver_params
                params.require(:driver)
                .permit(:name)
            end
            
    end
end
