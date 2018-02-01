class UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  def show
   @user = current_user
   @User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def user_params
    params.require(:user).permit(:email, :avatar)
  end

end
