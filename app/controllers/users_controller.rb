class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save(user_params)
      session[:user] = @user
      redirect_to home_path
    else
      flash[:notice] = @user.errors.full_messages[0]
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :password,
      :email,
      :account_balance
    )
  end
end
