class Skill < ActiveRecord::Base
  has_many :skills_speakers
  has_many :speakers, :through => :skills_speakers
end
