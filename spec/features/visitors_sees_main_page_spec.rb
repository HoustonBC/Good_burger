require 'rails_helper'

feature "visitors sees a grid of restaurants" do
  scenario "sees a grid of restaurants and link to add a new restaurant" do
    r1 = Restaurant.create(name: "a", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img")
    r2 = Restaurant.create(name: "b", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img")

    visit restaurants_path

    expect(page).to have_content "a"
    expect(page).to have_link "a"

    clink_link "A"
  end
end
