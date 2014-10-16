class AddBlurbToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :blurb, :string
  end
end
