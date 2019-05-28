class ApplicationController < ActionController::Base
  def root
    @user = User.new
  end

  def home
    @user = User.new(session[:user])
  end

  def confirm
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
    session[:user] = User.find_by(username: params[:username])
    @user = session[:user]
    redirect_to home_path
    else
    flash[:notice] = "Incorrect Username or password"
    redirect_to login_path
    end
  end

  def login
  end

  def success
  end

end
