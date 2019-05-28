class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"
  has_many :user_transactions
  has_many :transacktions, through: :user_transactions

  validates :username, uniqueness: true

  has_secure_password

end
