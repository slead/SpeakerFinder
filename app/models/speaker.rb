class Speaker < ActiveRecord::Base
  validates_presence_of :name, :email, :city  
  validates :website, :format => URI::regexp(%w(http https))
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  geocoded_by :city
  after_validation :geocode, :if => :city_changed?
  
end
