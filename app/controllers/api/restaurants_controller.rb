class Api::RestaurantsController < ApiController
  def index
    render json: Restaurant.all
  end

  def show
    render json: { restaurant: Restaurant.find(params[:id])}
  end
end
