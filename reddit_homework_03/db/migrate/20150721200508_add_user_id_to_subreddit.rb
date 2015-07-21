class AddUserIdToSubreddit < ActiveRecord::Migration
  def change
    add_column :subreddits, :user_id, :integer
  end
end
