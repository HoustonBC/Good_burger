class ReviewsController < ApplicationController
<<<<<<< HEAD

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
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
=======
  
>>>>>>> cfc314d72b5577c60ba3eaa4c33851e0e5149ec6
end
