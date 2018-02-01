class RestaurantsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant.id)
  end

  def new
    @user = current_user
    #@user = User.find_by(id: session[:user_id])
    @restaurant = Restaurant.new
  end

  def create
    # @user = current_user
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user



    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
      flash[:notice] = 'Restaurant added successfully'
    else
      flash[:error] = @restaurant.errors.full_messages.join(", ")
      render :new
    end

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path
  end

  protected

  def restaurant_params
    params.require(:restaurant).permit(:name, :picture, :address, :city, :state, :zip, :description)
  end


  def user_params
    params.require(:user).permit(:email, :encrypted_password)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
