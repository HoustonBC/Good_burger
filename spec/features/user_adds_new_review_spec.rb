require 'rails_helper'

feature "visitor adds reviews for restaurants" do
  #helper file needed
  let(:brendan) { FactoryBot.create(:user) }
  before(:each) do
    sign_in(brendan)
  end
  scenario "successfully adds a review" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    visit restaurant_path(r1)


    click_link "Add Review"

    expect(page).to have_content "Review for macdonalds"

    fill_in "Title", with: "I hate this place"
    fill_in "Description", with: "man do i hate this place"
    fill_in "Rating", with: "1"
    fill_in "Price", with: "2"

    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content r1.name
    expect(page).to have_content 1
    expect(page).to have_content "man do i hate this place"
  end

  scenario "adds a review for a restaurant unsuccessfully" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    visit restaurant_path(r1)

    click_link "Add Review"

    expect(page).to have_content "Review for macdonalds"

    click_button "Add Review"

    expect(page).to have_content "Rating can't be blank"
    expect(page).to have_content "Title can't be blank"
  end
end
