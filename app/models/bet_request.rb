class BetRequest < ApplicationRecord
  has_many :user_bet_requests
  has_many :users, through: :user_bet_requests
  validate :user_exist
  after_create :associate

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
    self.get_users.each do |user|
      @ubr = UserBetRequest.create(user_id: user.id, bet_request_id: self.id)
    end
  end

  private

  def user_exist
    if !(User.find_by(username: self[:recipient]))
      errors[:recipient] << 'Invalid'
    end
  end


end




    # @user = User.find_by(username: bet_request_params[:recipient])
    # if !@user
    #   redirect_to new_bet_request_path
    # end
