class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :upvotes, :count, :counter
  end
end
