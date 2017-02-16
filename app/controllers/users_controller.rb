class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root      
    elsif (user_params[:password] != user_params[:password_confirmation])
      redirect_to :new_user, notice: 'Passwords does not match.'
    else
      redirect_to :new_user, notice: 'Email has already been used.'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
