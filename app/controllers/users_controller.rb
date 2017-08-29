class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private
    def user_params
      params.require(:user).permit(:avatar_url, :first_name, :last_name, :username, :password, :password_confirmation)
    end
end
