class UsersController < ApplicationController

  def new
    if session[:user_id]
      redirect_to :root
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      session[:user_email] = user.email
      session[:user_first_name] = user.first_name
      session[:user_last_name] = user.last_name
      redirect_to :root      
    elsif (user_params[:password] != user_params[:password_confirmation])
      redirect_to :new_user, notice: 'Passwords does not match.'
    elsif (user_params[:password].length < 8)
      redirect_to :new_user, notice: 'Password needs to be 8 characters minimum.'
    else
      redirect_to :new_user, notice: 'Email has already been used.'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
