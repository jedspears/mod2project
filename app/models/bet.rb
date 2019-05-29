class Bet < ApplicationRecord
  has_many :transacktions
  has_one :holding_account
  accepts_nested_attributes_for :transacktions

  def transacktions_attributes=(transacktion_attributes)
    # byebug
    transacktion = Transacktion.create(transacktion_attributes["0"])
    self.transacktions << transacktion
    # byebug
  end

  def pot
    pot = 0
    self.transacktions.map { |t| pot += t.amount }
    pot * (self.transacktions.length + 1)
  end

  def get_usernames
    usernames = []
    self.transacktions.each do |t|
       usernames << t.username1
       usernames << t.username2
    end
    usernames.uniq
  end

  def get_users
    users = []
    get_usernames.each do |username|
      users << User.find_by(username: username)
    end
    users
  end
 


end
