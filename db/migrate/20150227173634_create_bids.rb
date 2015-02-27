class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.references :user, index: true
      t.references :auction, index: true

      t.timestamps null: false
    end
    add_foreign_key :bids, :users
    add_foreign_key :bids, :auctions
  end
end
