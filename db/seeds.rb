# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(email: "e@e.com", password: "password")
u2 = User.create!(email: "e2@e.com", password: "password")
a1 = User.create!(email: "admin@gmail.com", password: "password", role: "admin")
r1 = Restaurant.create!(name: "a", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "https://s3-media3.fl.yelpcdn.com/bphoto/0Ng1Qg4MlpQ9rfEC1qTeLw/ls.jpg", user: u1)
r2 = Restaurant.create!(name: "b", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "https://s3-media2.fl.yelpcdn.com/bphoto/-MeZnpADTjZdhgVG-Px37g/ls.jpg", user: u1)
review1= Review.create!(title: "review seed title by u1", rating: "2", price: "4", restaurant_id: r1.id, user_id: u1.id)
review2= Review.create!(title: "review seed title2 by u2", rating: "3", price: "5", restaurant_id: r1.id, user_id: u2.id)
review3= Review.create!(title: "review seed title3", rating: "3", price: "5", restaurant_id: r1.id, user_id: u2.id)
review4= Review.create!(title: "review seed title4", rating: "3", price: "5", restaurant_id: r1.id, user_id: u2.id)
review5= Review.create!(title: "review seed title5", rating: "3", price: "5", restaurant_id: r1.id, user_id: u2.id)
review6= Review.create!(title: "review seed title6", rating: "3", price: "5", restaurant_id: r1.id, user_id: u2.id)
review7= Review.create!(title: "review seed title7", rating: "3", price: "5", restaurant_id: r2.id, user_id: u2.id)
review8= Review.create!(title: "review seed title8", rating: "3", price: "5", restaurant_id: r2.id, user_id: u2.id)
review9= Review.create!(title: "review seed title9", rating: "3", price: "5", restaurant_id: r2.id, user_id: u2.id)
