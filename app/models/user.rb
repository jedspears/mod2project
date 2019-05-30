class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"
  has_many :user_bets
  has_many :bets, through: :user_bets
  has_many :user_bet_requests
  has_many :bet_requests, through: :user_bet_requests

  validates :username, uniqueness: true

  has_secure_password

end
