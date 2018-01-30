class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params)
    @review.user = current_user.id

    @review.restaurant = @restaurant
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
