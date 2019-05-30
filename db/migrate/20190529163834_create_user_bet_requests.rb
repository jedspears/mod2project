class CreateUserBetRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_bet_requests do |t|
      t.integer :user_id
      t.integer :bet_request_id

      t.timestamps
    end
  end
end
