class SessionsController < ApplicationController
  def new

  end

  def create
    username = params[:user]
    password = params[:password]
    user = Driver.find_by(name: username)
    if Driver.exists?(name: username) && user.authenticate(params[:password])
      session[:user] = user
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = "Incorrect username/password"
      redirect_to :back
    end
  end

  def destroy
    session[:user] = nil
    flash[:notice] = "Logged out!"
    redirect_to '/login'

  end

end