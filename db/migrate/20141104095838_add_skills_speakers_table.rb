class AddSkillsSpeakersTable < ActiveRecord::Migration
  def change
    create_table :skills_speakers, id: false do |t|
      t.belongs_to :physician
      t.belongs_to :patient
      t.timestamps
    end
    
    # add_index :skills_speakers, [:skill_id, :speaker_id]
  end
end
