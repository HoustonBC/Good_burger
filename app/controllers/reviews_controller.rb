class ReviewsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params)
    @review.user_id = current_user.id

    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
      flash[:notice] = "Review added successfully"
    else

      @reviews = @restaurant.reviews

      flash[:error] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])

    if @review.update(review_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

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
    params.require(:review).permit(:title, :rating, :price, :user_id, :restaurant_id, :body)
  end

  def restaurant_params
    params.require(:restaurants).permit(:id)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
