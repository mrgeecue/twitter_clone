class SessionsController < ApplicationController
  def index
  end

  def create
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
