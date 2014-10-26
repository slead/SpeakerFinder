class RenameCommentUserToUserId < ActiveRecord::Migration
  def change
    rename_column :comments, :user, :user_id
  end
end
