class BetsController < ApplicationController

  def new
    @bet = Bet.new
    @user = current_user
  end

  def create
    @bet = Bet.create(bet_params)
    @holding_account = HoldingAccount.create(balance: @bet.pot, bet_id: @bet.id)
    redirect_to @bet
  end

  def index
    @user = current_user
    # byebug
  end

  def show
    byebug
    @bet = Bet.find(params[:id])
  end



  private

  def bet_params
    params.require(:bet).permit(:description, :username1, :username2, :amount, :accept?)
  end
end
