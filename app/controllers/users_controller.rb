class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  private 
  def user_params
    params.require(:user).permit(:display_name, :avatar, :email, )
  end
end
