class CreateGeoSearches < ActiveRecord::Migration
  def change
    create_table :geo_searches do |t|

      t.timestamps
    end
  end
end
