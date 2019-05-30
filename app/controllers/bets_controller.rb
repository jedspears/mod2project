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
    # byebug
    @user = current_user
    @active_bets = @user.bets.select { |bet| bet.status == "active" }
    @closed_bets = @user.bets.select { |bet| bet.status == "closed" }
    # byebug
  end

  def show
    # byebug
    @bet = Bet.find(params[:id])
  end

  def orange
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    if @bet.update(bet_params)
      redirect_to bets_path
    end
    @bet.assign_winner
  end

  # def delete
  #   Bet.find(params[:id]).destroy
  #   redirect_to bets_path
  # end



  private

  def bet_params
    params.require(:bet).permit(:description, :username1, :username2, :amount, :accept, :winner1, :winner2, :real_winner)
  end
end
