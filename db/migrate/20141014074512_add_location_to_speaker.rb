class AddLocationToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :city, :string
    add_column :speakers, :state, :string
    add_column :speakers, :country, :string
    add_column :speakers, :lat, :float
    add_column :speakers, :lng, :float
  end
end
