class ReviewsController < ApplicationController

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant.id)
    @review = Review.find(params[:id])
    @review.destroy
    render "/restaurants/show"
  end



  private

  def review_params
    params.require(:review).permit(:id)
  end

  def restaurant_params
    params.permit(:id)
  end
end
