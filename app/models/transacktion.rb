class Transacktion < ApplicationRecord
  has_many :user_transactions
  has_many :users, through: :user_transactions
  belongs_to :bet
end
