class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(session_params[:email])

    if !user
      return redirect_to :new_session, notice: 'Email does not exist.'
    end
    
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      return redirect_to :root
    else
    # If user's login doesn't work, send them back to the login form.
      return redirect_to :new_session, notice: 'Login Failed.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

    def session_params
      params.require(:sessions).permit(:email, :password)
    end

end
