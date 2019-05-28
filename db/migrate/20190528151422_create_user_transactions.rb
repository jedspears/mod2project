class CreateUserTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_transactions do |t|
      t.integer :user_id
      t.integer :transacktion_id

      t.timestamps
    end
  end
end
