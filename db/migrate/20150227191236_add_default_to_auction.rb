class AddDefaultToAuction < ActiveRecord::Migration
  def change
    remove_column :auctions, :amount
    add_column :auctions, :amount, :integer, default: 0
  end
end
