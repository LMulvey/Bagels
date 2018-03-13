require 'faker'

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Let's seed the database
puts 'Starting seed process...'
(1..10).each do
    puts 'Creating Driver.'
    driver = Driver.create!({
        first_name: Faker::Name.first_name,
        last_name:  Faker::Name.last_name
    })
    puts 'Creating Tickets for Driver....'
    (1..5).each do
        ticket = driver.tickets.create!({
            status: "active",
            description: Faker::SiliconValley.motto
        })
        ticket.events.create!({
            event_type: "start",
        })
        ticket.events.create!({
            event_type: "delivery",
            description: Faker::SiliconValley.quote,
            address: Faker::Address.street_address
        })
        ticket.events.create!({
            event_type: "pickup",
            description: Faker::SiliconValley.quote,
            address: Faker::Address.street_address
        })
        ticket.events.create!({
            event_type: "stop",
        })
    end
end

