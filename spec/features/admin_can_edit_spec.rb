require 'rails_helper'

feature "admin " do
  #helper file needed
  let(:brendan) { FactoryBot.create(:user, role: "admin") }
  before(:each) do
    sign_in(brendan)
  end

  scenario "can successfully edit a review" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    review1= Review.create!(title: "review for r1", rating: "2", price: "4", restaurant_id: r1.id, user_id: brendan.id)

    visit restaurant_path(r1)

    click_link "Edit Review"

    fill_in "Title", with: "I actually like this now"
    fill_in "Description", with: "fixed my crooked back"
    fill_in "Rating", with: "5"
    fill_in "Price", with: "1"

    click_button "Add Review"

    expect(page).to have_content "I actually like this now"
  end

  scenario "can successfully edit a restaurant" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    review1= Review.create!(title: "review for r1", rating: "2", price: "4", restaurant_id: r1.id, user_id: brendan.id)

    visit restaurant_path(r1)

    click_link "Edit Restaurant"

    fill_in "Name", with: "McDonalds 2.0"
    fill_in "Picture", with: "www.picture.org"
    fill_in "Address", with: "123"
    fill_in "City", with: "Yorkland"
    fill_in "State", with: "MA"
    fill_in "Zip", with: "12345"
    fill_in "Description", with: "Description"

    click_button "Add Restaurant"

    expect(page).to have_content "McDonalds 2.0"
    expect(page).to have_content "123"
    expect(page).to have_content "Yorkland"
    expect(page).to have_content "MA"
    expect(page).to have_content "12345"
    expect(page).to have_content "Description"
  end



end
