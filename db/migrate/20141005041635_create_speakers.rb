class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :website
      t.string :email
      t.string :twitter_handle
      t.text :about

      t.timestamps
    end
  end
end
