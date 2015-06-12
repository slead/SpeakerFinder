# Model for speakers
class Speaker < ActiveRecord::Base
  searchkick autocomplete: ['name']
  has_many :skills_speakers
  has_many :skills, :through => :skills_speakers
  has_many :comments, dependent: :destroy
  validates_presence_of :name, :email, :city
  validates :website, format: URI.regexp(%w(http https))
  validates :name, uniqueness: true, :case_sensitive => false
  validates :email, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.gif|jpg|png}i,
    message: 'must be a url for gif, jpg, or png image.'
  }
  geocoded_by :city
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.state = geo.state
      obj.country = geo.country_code
    end
  end
  after_validation :geocode, if: :city_changed?
  after_validation :reverse_geocode, if: :city_changed?

# This has been replaced with the ElasticSearch/Bloodhound search
#  def self.search(query)
#    #perform a case-insensitive seach by name
#    where("LOWER(name) like ?", "%#{query.downcase}%") 
#  end

end
