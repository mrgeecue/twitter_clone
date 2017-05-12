class UsersController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/posts/show"
    else
      flash[:error] = @user.errors.full_messages.to_s
      redirect_to '/'
    end
  end

  def update
    @user = User.find_by(params[:user_id])
    @user.update(user_params)
      redirect_to '/posts/index'
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password, :username)
  end
end
