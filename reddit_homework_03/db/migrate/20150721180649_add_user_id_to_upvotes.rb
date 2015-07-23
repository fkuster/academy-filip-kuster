class AddUserIdToUpvotes < ActiveRecord::Migration
  def change
      rename_column :upvotes, :counter, :user_id
  end
end
