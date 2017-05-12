class SessionsController < ApplicationController
  def index
  end

  def create
    @user = User.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/posts/show'
      else
        flash[:error] = @user.errors.full_messages.to_s
        redirect_to '/'
      end
    end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  def session_params
    params.require(:sessions).permit(:email, :password)
  end
end
