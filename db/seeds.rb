# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(email: "h@h.com", password: "password")
r1 = Restaurant.create!(name: "a", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: u1)
r2 = Restaurant.create!(name: "b", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: u1)
