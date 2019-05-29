class BetsController < ApplicationController

  def new
    @bet = Bet.new
    @user = User.find_by(id: session[:user])
  end

  def create
    # byebug
    @bet = Bet.create(bet_params)
    @holding_account = HoldingAccount.create(balance: @bet.pot, bet_id: @bet.id)
    # byebug
    redirect_to @bet
  end

  def show
    @bet = Bet.find(params[:id])
  end



  private

  def bet_params
    params.require(:bet).permit(:description, transacktions_attributes: [:username1, :username2, :amount, :bet_id])
  end
end
