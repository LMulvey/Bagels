require 'faker'

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Let's seed the database
(1..10).each do
    driver = Driver.create!({
        first_name: Faker::Name.first_name,
        last_name:  Faker::Name.last_name
    })
    (1..5).each do
        ticket = driver.tickets.create!({
            status: "active",
            description: Faker::SiliconValley.motto
        })

        ticket.events.create!({
            status: "active",
            event_type: "delivery",
            description: Faker::SiliconValley.quote,
            address: Faker::Address.street_address
        })
    end
end

