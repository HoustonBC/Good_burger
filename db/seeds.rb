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
r1 = Restaurant.create!(name: "Mainely Burgers", address: "704 Massachusetts Avenue", city: "Cambridge", state: "MA", zip: "02139", picture: "https://cdn.dribbble.com/users/837685/screenshots/2964651/mainely-b4_1x.jpg", user: u1)
r2 = Restaurant.create!(name: "Boston Burger Company", address: "37 Davis", city: "Somerville", state: "MA", zip: "02144", picture: "https://c.o0bg.com/rf/image_371w/Boston/2011-2020/2012/07/13/BostonGlobe.com/Magazine/Images/22MAG_KingBurger78.jpg", user: u1)
r3 = Restaurant.create!(name: "Cragie on Main", address: "853 Main Street", city: "Cambridge", state: "MA", zip: "02139", picture: "https://s3-media3.fl.yelpcdn.com/bphoto/bJwyf7EVV5Og2NSwUEM7rQ/348s.jpg", user: u1)
r4 = Restaurant.create!(name: "The Gallows", address: "1395 Washington Street", city: "Boston", state: "MA", zip: "02118", picture: "https://www.oubruncher.com/photos1/4236_1.jpg", user: u1)
r5 = Restaurant.create!(name: "The Local", address: "1391 Washington Street", city: "West Newton", state: "MA", zip: "02465", picture: "https://i.ytimg.com/vi/2uUDTOzrO-g/maxresdefault.jpg", user: u1)
review1= Review.create!(title: "Poor burgers, over-priced", rating: "2", price: "4", restaurant_id: r1.id, user_id: u1.id)
review2= Review.create!(title: "Expensive but totally worth it!", rating: "5", price: "5", restaurant_id: r1.id, user_id: u2.id)
review3= Review.create!(title: "So-so", rating: "3", price: "4", restaurant_id: r2.id, user_id: u2.id)
review4= Review.create!(title: "A terrible restaurant", rating: "1", price: "5", restaurant_id: r1.id, user_id: u2.id)
review5= Review.create!(title: "Overcooked burgers", rating: "2", price: "4", restaurant_id: r5.id, user_id: u2.id)
review6= Review.create!(title: "Pretty, pretty, pretty...pretty good", rating: "3", price: "3", restaurant_id: r3.id, user_id: u2.id)
review7= Review.create!(title: "I am in love with this place", rating: "5", price: "5", restaurant_id: r3.id, user_id: u1.id)
review8= Review.create!(title: "Just OK", rating: "3", price: "5", restaurant_id: r5.id, user_id: u1.id)
review9= Review.create!(title: "I go here every week", rating: "4", price: "5", restaurant_id: r4.id, user_id: u1.id)
