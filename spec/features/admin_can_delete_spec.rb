require 'rails_helper'

feature "admin " do
  #helper file needed
  let(:brendan) { FactoryBot.create(:user, role: "admin") }
  before(:each) do
    sign_in(brendan)
  end
  scenario "deletes a restaurant successfully" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    visit restaurant_path(r1)

    click_link "Delete Restaurant"

    #click_button "OK"
    expect(page).not_to have_content "macdonalds"
  end
  #save_and_open_page
  scenario "deletes a review successfully" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    review1= Review.create!(title: "review for r1", rating: "2", price: "4", restaurant_id: r1.id, user_id: brendan.id)
    visit restaurant_path(r1)

    click_link "Delete Review"

    expect(page).not_to have_content "review for r1"
  end
end
