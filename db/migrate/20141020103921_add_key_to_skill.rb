class AddKeyToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :key, :string
  end
end
