class DeleteColumnsFromPostAndComment < ActiveRecord::Migration
  def change
     remove_column :comments, :author_name
     remove_column :posts, :creator_name
  end
end
