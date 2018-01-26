class ReviewsController < ApplicationController

  def new
    @restaurants = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurants = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
      flash[:notice] = "Review Successfully Added"
    else

      @reviews = @restaurant.reviews
      flash[:error] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :vote, :body, :price, :created_at)
  end
end
