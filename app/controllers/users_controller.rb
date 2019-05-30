class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save(user_params)
      session[:user] = @user[:id]
      redirect_to home_path
    else
      flash[:notice] = @user.errors.full_messages[0]
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    # @current_user = current_user
  end

  def edit
    @user = User.find(params[:id])
    # @current_user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      session[:user] = @user.id
      redirect_to @user
    else
      flash[:notice] = @user.errors.full_messages[0]
      redirect_to edit_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :password,
      :email
    )
  end
end
