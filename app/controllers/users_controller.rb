class UsersController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/index"
    end
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end
