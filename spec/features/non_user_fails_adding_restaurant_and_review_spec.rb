require 'rails_helper'

xfeature "non_user_fails_adding_restaurant_and_review" do
  #helper file needed
  let(:brendan) { FactoryBot.create(:user) }
  xscenario "unsuccessfully adds a review" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    visit new_restaurant_review_path(r1)


    expect(page).to have_content "Not Found"

  end

  xscenario "unsuccessfully adds a restaurant" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    visit new_restaurant_path


    expect(page).to have_content "Not Found"

  end

end
