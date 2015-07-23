class AddAvatarToUser < ActiveRecord::Migration
  def up
   add_attachment :users, :avatar
  end

end
