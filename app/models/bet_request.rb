class BetRequest < ApplicationRecord
  has_many :user_bet_requests
  has_many :users, through: :user_bet_requests

  # after_create :associate

  def get_users
    users = []
    users << User.find_by(username: self.sender)
    users << User.find_by(username: self.recipient)
    users
  end

  def find_recipient
    @recipient = User.find_by(username: self.recipient)
  end

  def associate
    byebug
    self.get_users.each do |user|
      @ubr = UserBetRequest.create(user_id: user.id, bet_request_id: self.id)
    end
  end



end
