class CreateTransacktions < ActiveRecord::Migration[5.2]
  def change
    create_table :transacktions do |t|
      t.string :username1
      t.string :username2
      t.integer :amount
      t.integer :bet_id

      t.timestamps
    end
  end
end
