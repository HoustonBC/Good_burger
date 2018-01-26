require "rails_helper"

RSpec.describe Api::RestaurantsController, type: :controller do
  let!(:user) {User.create!(email: "b@b.com", password: "password")}
  let!(:first_restaurant) { Restaurant.create!(name: "a", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: user) }
  let!(:second_restaurant) { Restaurant.create!(name: "b", address: "500 summer street", city: "Boston", state: "MA", zip: "86753", picture: "this.img", user: user) }

  describe "GET#index" do
    it "should return a list of all the Restaurants" do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 2
      expect(returned_json[0]["name"]).to eq "a"


    end
  end

  describe "GET#show" do
    it "should show a restaurants show page" do
      get :show, params: {id: first_restaurant.id}
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json["restaurant"].length).to eq 11
      expect(returned_json["restaurant"]["name"]).to eq "a"
      expect(returned_json["restaurant"]["address"]).to eq "500 summer street"
    end
  end
end
