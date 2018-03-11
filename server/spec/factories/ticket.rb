FactoryBot.define do 

    factory :ticket do
        driver
        description "Go from A to B and make a delivery."
        created_at { 2.days.ago }
        status { ["active", "completed"].sample }
        start_time { 2.hours.ago } 
        stop_time { 1.hour.ago }
    end

end
