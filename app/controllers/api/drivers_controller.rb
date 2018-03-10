module Api
    class DriversController < ApplicationController
    # TODO: Build out auth for drivers - password, further contact details
    # Seems out of scope for this assignment. Get to it if everything else
    # is done rather quickly?
    
        public
            def index
                render json: Driver.all
            end

            def show
                @driver = Driver.find(params[:id])
                render json: @driver
            end

            def create
                @driver = Driver.new(driver_params)
                if @driver.save
                    @result = :success
                else
                    @result = :error
                end
                render json: generate_response(record: @driver, type: @result)
            end

            def update
                @driver = Driver.find_by(id: params[:id])
                if !@driver
                    render json: generate_response(record: @driver, type: :error, message: 'Could not find Driver. Check ID.') 
                else
                    if @driver.update(driver_params)
                        @result = :success
                    else
                        @result = :error
                    end
                    render json: generate_response(record: @driver, type: @result)                    
                end
            end

            def destroy
                @driver = Driver.find_by(id: params[:id])
                if !@driver
                    render json: generate_response(record: @driver, type: :error, message: 'Could not find Driver. Check ID.') 
                else
                    if @driver.destroy!
                        @result = :success
                    else
                        @result = :error
                    end
                    render json: generate_response(record: @driver, type: @result)                    
                end
            end

        private
            def driver_params
                params.require(:driver)
                .permit(:first_name, :last_name)
            end
            
    end
end
