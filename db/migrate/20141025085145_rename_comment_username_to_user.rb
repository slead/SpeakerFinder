class RenameCommentUsernameToUser < ActiveRecord::Migration
  def change
    rename_column :comments, :username, :user
  end
end
