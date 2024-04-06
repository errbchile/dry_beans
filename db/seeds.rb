# frozen_string_literal: true

require 'faker'

10.times do
  Itinerary.create(driver: Faker::Name.name)
end

Itinerary.all.each do |itinerary|
  3.times do
    itinerary.paths.create(departure: Faker::Address.street_address, arrival: Faker::Address.street_address)
  end
end

Path.all.each do |path|
  5.times do
    path.deliveries.create(client: Faker::Name.name, product: Faker::Commerce.product_name)
    path.collections.create(client: Faker::Name.name, product: Faker::Commerce.product_name)
  end
end
