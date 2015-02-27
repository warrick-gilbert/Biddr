class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.string :body
      t.integer :amount
      t.integer :reserve
      t.datetime :closing_date
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :auctions, :users
  end
end
