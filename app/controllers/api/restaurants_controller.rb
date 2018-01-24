class Api::RestaurantsController < ApiController
  def show
    render json: { restaurant: Restaurant.find(params[:id])}
  end
end
