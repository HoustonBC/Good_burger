class ReviewsController < ApplicationController

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    #@reviews = Review.where(restaurant_id: @restaurant.id)
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:id)
  end

  def restaurant_params
    params.require(:restaurants).permit(:id)
  end

end
