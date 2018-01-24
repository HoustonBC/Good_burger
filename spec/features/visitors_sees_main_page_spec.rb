require 'rails_helper'

feature "visitors sees a grid of restaurants" do
  xscenario "sees a grid of restaurants and link to add a new restaurant" do
    r1 = Restaurant.create(name: "a", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img")
    r2 = Restaurant.create(name: "b", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img")

    visit restaurants_path

    expect(page).to have_content "a"
    expect(page).to have_link "a"

    clink_link "Add New Restaurant"

    expect(page).to have_content "Add A New Restaurant"
  end
  xscenario "clicks link and is taken to show page for given restaurant" do
    r1 = Restaurant.create(name: "a", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img")

    visit root_path

    click_link "a"

    expect(page).to have_content r1.name
    expect(page).to have_content r1.address
    expect(page).to have_content r1.city
    expect(page).to have_content r1.state
    expect(page).to have_content r1.zip
    expect(page).to have_content r1.description
    expect(page).to have_content r1.picture
  end
end
