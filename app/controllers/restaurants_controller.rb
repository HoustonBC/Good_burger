class RestaurantsController < ApplicationController
  def index
  end

  def show
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
  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :picture, :address, :city, :state, :zip, :description)
  end


  def user_params
    params.require(:user).permit(:email, :encrypted_password)
  end
end
