class Speaker < ActiveRecord::Base
  validates_presence_of :name, :email, :city  
  validates :website, :format => URI::regexp(%w(http https))
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  geocoded_by :city
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.state = geo.state
      obj.city = geo.city
      obj.country = geo.country_code
    end
  end
  after_validation :geocode, :if => :city_changed?
  after_validation :reverse_geocode, :if => :city_changed?
  
end
