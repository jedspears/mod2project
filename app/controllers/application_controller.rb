class ApplicationController < ActionController::Base

  before_action :authorized #lock down this whole app
  helper_method :current_user #i can call current_user from a view

skip_before_action :authorized, only: [:confirm, :login, :root]


def current_user
  # User.find would throw an error if we cannot find the user
  User.find_by({ id: session[:user]})
end

def logged_in?
  # nil is falsey in ruby
  # a user instance is truthy
  !!current_user
end

def authorized
  redirect_to login_path unless logged_in?
end




  def root
    @user = User.new
  end

  def home
    @user = User.find_by(id: session[:user])
  end

  def confirm
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
    session[:user] = @user.id
    redirect_to home_path
    else
    flash[:notice] = "Invalid Username or password"
    redirect_to login_path
    end
  end

  def login
  end

  def success
  end

end
