class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|

      t.timestamps
    end
  end
end
