FactoryBot.define do 

    factory :ticket do
        driver
        description "Go from A to B and make a delivery."
        created_at { 2.days.ago }
        status "active"
        start_time { 1.day.ago }
        stop_time { 1.hour.ago }
    end

end
