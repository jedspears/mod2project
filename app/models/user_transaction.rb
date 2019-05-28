class UserTransaction < ApplicationRecord
  belongs_to :transacktion
  belongs_to :user
end
