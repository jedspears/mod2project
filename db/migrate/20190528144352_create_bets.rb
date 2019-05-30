class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.text :description
      t.string :username1
      t.string :username2
      t.integer :amount

      t.timestamps
    end
  end
end
