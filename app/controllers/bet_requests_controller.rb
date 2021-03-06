class BetRequestsController < ApplicationController

  def index
    # byebug
    @user = current_user
    @sent = @user.bet_requests.select { |request| request.sender == @user.username }
    @received = @user.bet_requests.select { |request| request.recipient == @user.username }
  end

  def new
    @bet_request = BetRequest.new
    @user = current_user
  end

  def create
    @bet_request = BetRequest.create(bet_request_params)

    byebug
    @bet_request.associate
    (User.all.uniq - [current_user]).each do |user|
      Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @bet_request)
    if @bet_request.amount > 1 && @bet_request.amount > current_user.account_balance
      flash[:notice] = "amount need to be over 0 or your account balance is below bet amount"
      redirect_to new_bet_request_path
    elsif @bet_request.valid?
      redirect_to @bet_request
    else
      flash[:notice] = @bet_request.errors.full_messages
      redirect_to new_bet_request_path
    end
    byebug
    redirect_to @bet_request

  end

  def edit
    @bet_request = BetRequest.find(params[:id])
    @sender = @bet_request.sender
  end

  def respond
    @bet_request = BetRequest.find(params[:id])
  end

  def show
    @bet_request = BetRequest.find(params[:id])
  end

  def update
    @bet_request = BetRequest.find(params[:id])

    @bet_request.update(bet_request_params)
    redirect_to @bet_request
  end

  def bananas
    @bet_request = BetRequest.find(params[:id])
    @bet_request.update(bet_request_params)
    # byebug
    redirect_to delete_bet_request_path(@bet_request)
  end

  # def transfer
  #   @bet_request = BetRequest.find(params[:id])
  #   @bet = Bet.new(
  #     username1: @bet_request.sender,
  #     username2: @bet_request.recipient,
  #     amount: @bet_request.amount,
  #     description: @bet_request.description
  #   )
  #   if params[:accept?] == true
  #     redirect_to delete_bet_request_path(@bet_request) and return
  #   else
  #     redirect_to delete_bet_request_path(@bet_request)
  #   end
  #   redirect_to create_bet_path(@bet)
  # end

  def delete
    @bet_request = BetRequest.find(params[:id])
    @bet = Bet.new(
      username1: @bet_request.sender,
      username2: @bet_request.recipient,
      amount: @bet_request.amount,
      description: @bet_request.description
    )

    if @bet_request.accept == true
      @bet_request.destroy
      @bet.save
      redirect_to @bet
    else
      @bet_request.destroy
      redirect_to home_path
    end
  end

  private

  def bet_request_params
    params.require(:bet_request).permit(:description, :sender, :recipient, :amount, :accept)
  end
end
