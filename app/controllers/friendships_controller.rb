class FriendshipsController < ApplicationController

  def index
    @user = current_user
    # byebug
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      @friend_id = User.find_by(username: params[:user][:username]).id
      @friendship1 = Friendship.create(user_id: session[:user], friend_id: @friend_id)
      @friendship2 = Friendship.create(user_id: @friend_id, friend_id: session[:user])
      # byebug
      redirect_to home_path
    elsif params[:user][:username] == ""
      flash[:notice] = "Missing username"
      redirect_to new_friendship_path
    else
      flash[:notice] = "Invalid username"
      redirect_to new_friendship_path
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
