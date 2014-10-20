class AddAttributesToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :title, :string
  end
end
