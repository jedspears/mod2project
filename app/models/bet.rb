class Bet < ApplicationRecord
  has_many :user_bets
  has_many :users, through: :user_bets
  has_one :holding_account

  after_create :subtract_money, :associate
  # after_update :assign_winner

  def pot
    pot = self.amount * 2
  end

  # def get_usernames
  #   usernames = []
  #   self.transacktions.each do |t|
  #      usernames << t.username1
  #      usernames << t.username2
  #   end
  #   usernames.uniq
  # end

  def get_users
    users = []
    users << User.find_by(username: self.username1)
    users << User.find_by(username: self.username2)
    users
  end

  def subtract_money
    # byebug
    self.get_users.map do |user|
      user.account_balance -= self.amount
      user.save
    end
  end

  def reward_money
    # byebug
    @winner = User.find_by(username: self.real_winner)
    @winner.account_balance += self.pot
    @winner.save
  end

  def associate
    self.get_users.each do |user|
      UserBet.create(user_id: user.id, bet_id: self.id)
    end
  end

  def assign_winner
    # byebug
    if self.winner1 == self.winner2
      self.real_winner = self.winner1
      self.reward_money
      self.change_status
    end
  end

  def change_status
    # byebug
    self.update(status: "closed")
    # self.status = "closed"
    # self.save
  end

end
