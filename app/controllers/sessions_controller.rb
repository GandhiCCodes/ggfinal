class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email]) 

    if @user && @user.authenticate(params[:password])  # FIXED LINE
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back!"
      redirect_to "/places"
    else
      flash[:notice] = "Invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to "/login"
  end
end
