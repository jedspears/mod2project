class CreateHoldingAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :holding_accounts do |t|
      t.integer :balance
      t.integer :bet_id

      t.timestamps
    end
  end
end
