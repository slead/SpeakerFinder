class SkillsSpeakers < ActiveRecord::Base
  belongs_to :skill
  belongs_to :speaker
end
