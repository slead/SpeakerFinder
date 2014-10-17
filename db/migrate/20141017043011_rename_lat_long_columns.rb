class RenameLatLongColumns < ActiveRecord::Migration
  def change
    rename_column :speakers, :lat, :latitude
    rename_column :speakers, :lng, :longitude
  end
end
