class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :post_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
