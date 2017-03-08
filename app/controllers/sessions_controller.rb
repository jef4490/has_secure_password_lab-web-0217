class SessionsController < ApplicationController
  def create
    # byebug
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to users_home_path
    else
      redirect_to users_home_path
    end
  end
end
