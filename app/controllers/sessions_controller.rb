class SessionsController < ApplicationController
  def def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in!'
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Incorrect email or password, try again."
      render :new
    end
  end

   def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out!"
  end

end
