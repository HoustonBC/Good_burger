class UsersController < ApplicationController


  def show
    @user = current_user
    #User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
  end

  def user_params
    params.require(:user).permit(:email, :avatar)
  end

end
