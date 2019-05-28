class ApplicationController < ActionController::Base
  def root
    @user = User.new
  end

  def home
    @user = User.new(session[:user])
    # byebug
  end

  def success
  end

end
