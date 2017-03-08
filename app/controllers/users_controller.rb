class UsersController < ApplicationController
  def new

  end
  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(name: params[:user][:name], password: params[:user][:password])
      user.save
      session[:user_id] = user.id
      redirect_to users_home_path
    else
      redirect_to new_user_path
    end
  end

  def home
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
