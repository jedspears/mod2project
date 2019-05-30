class Bet < ApplicationRecord
  has_many :user_bets
  has_many :user, through: :user_bets
  has_one :holding_account

  after_create :subtract_money, :associate


  # accepts_nested_attributes_for :transacktions
  #
  # def transacktions_attributes=(transacktion_attributes)
  #   # byebug
  #   transacktion = Transacktion.create(transacktion_attributes["0"])
  #   self.transacktions << transacktion
  #   # byebug
  # end

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

  def associate
    self.get_users.each do |user|
      UserBet.create(user_id: user.id, bet_id: self.id)
    end
  end



end
