class UserBetRequest < ApplicationRecord
  belongs_to :user
  belongs_to :bet_request
end
