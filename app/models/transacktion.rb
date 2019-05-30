class Transacktion < ApplicationRecord
  has_many :user_transactions
  has_many :users, through: :user_transactions
  belongs_to :bet

  after_create :subtract_money, :associate

  def subtract_money
    self.bet.get_users.map do |user|
      user.account_balance -= self.amount
      user.save
    end
  end

  def associate
    self.bet.get_users.each do |user|
      UserTransaction.create(user_id: user.id, transacktion_id: self.id)
    end
  end

end
