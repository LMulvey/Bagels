FactoryBot.define do 

    factory :event do
        ticket
        description "Attend address and deliver bagels"
        address "1011 12 Avenue SW Calgary, AB"
        measurement 25
        measurement_type "bagels"
        created_at { 2.days.ago }
        status { ["active", "completed"].sample }
        event_type { ["start", "stop", "delivery", "pickup"].sample }
        start_time { 1.day.ago }
        stop_time { 1.hour.ago }
    end

end
