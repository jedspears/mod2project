class CreateBetRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :bet_requests do |t|
      t.text :sender
      t.text :recipient
      t.integer :amount
      t.text :description
      t.boolean :accept

      t.timestamps
    end
  end
end
