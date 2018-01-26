require 'rails_helper'

feature "visitor can add restaurants" do
  let(:brendan) { FactoryBot.create(:user) }
  before(:each) do
    sign_in(brendan)
  end
  scenario "visitor adds new restaurant" do
    visit new_restaurant_path
    expect(page).to have_content "Submit Restaurant"

    fill_in "Name", with: "McDonalds"
    fill_in "Picture", with: "www.google.com"
    fill_in "Address", with: "101 Maple St."
    fill_in "City", with: "Boston"
    fill_in "State", with: "MA"
    fill_in "Zip", with: "02014"
    fill_in "Description", with: "This is a quality place to eat"
    click_button "Add Restaurant"

    expect(page).to have_content "Restaurant added successfully"
    expect(page).to have_content "McDonalds"
    expect(page).to have_content "This is a quality place to eat"

  end

  xscenario "visitor inputs invalid information" do
    visit new_restaurant_path

    click_button "Add Restaurant"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Picture can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
  end

  xscenario "visitor inputs invalid zipcode" do
    visit new_restaurant_path

    fill_in "Zip", with: "01"

    click_button "Add Restaurant"

    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
  end

  xscenario "visitor inputs invalid zipcode" do
    visit new_restaurant_path

    fill_in "Zip", with: "01123412312542133423"

    click_button "Add Restaurant"

    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
  end


end
