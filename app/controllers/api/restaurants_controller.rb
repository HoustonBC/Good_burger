class Api::RestaurantsController < ApiController
  def show
    render json: { restaurant: Restaurant.all }
  end
end
