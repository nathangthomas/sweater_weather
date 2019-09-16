# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  City.create!(
    name: Faker::Space.moon,
    state: Faker::Space.planet
  )
end

10.times do
  Forecast.create!(
    city_id: rand(1..10),
    temperature: rand(1..120),
    high: rand(50..120),
    low: rand(0..50),
    humidity: rand(0..100),
    visability: rand(0..100),
    uv_index: rand(0..100)
  )
end
