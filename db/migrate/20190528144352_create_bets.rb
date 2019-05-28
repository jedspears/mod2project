class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.text :description

      t.timestamps
    end
  end
end
