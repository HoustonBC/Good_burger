require 'rails_helper'

feature "visitor adds rating and price" do
  #helper file needed
  let(:brendan) { FactoryBot.create(:user) }
  let(:houston) { FactoryBot.create(:user) }
  before(:each) do
    sign_in(brendan)
  end
  scenario "successfully adds rating and price" do
    r1 = Restaurant.create!(name: "macdonalds", address: "500 summer street",
    city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: brendan)
    review1 = Review.create!(title: "Fantastic!", rating: "4", price: "3", vote_score: "1", user: houston)
    visit restaurant_path(r1)

    fill_in "Title", with: "Garbage!"
    fill_in "Description", with: "This place is hot trash."
    fill_in "Rating", with: "2"
    fill_in "Price", with: "3"

    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content r1.name
    expect(page).to have_content "Average Rating: 3"
    expect(page).to have_content "Average Price: 3"
  end

  scenario "visitor inputs invalid rating" do
    visit restaurant_path(r1)

    fill_in "Rating", with: "A"

    click_button "Add Review"

    expect(page).to have_content "Rating is not a number"
  end
  scenario "visitor inputs invalid price" do
    visit restaurant_path(r1)

    fill_in "Price", with: "A"

    click_button "Add Review"

    expect(page).to have_content "Price is not a number"
end
