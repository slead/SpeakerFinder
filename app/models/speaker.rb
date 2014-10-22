# Model for speakers
class Speaker < ActiveRecord::Base
  has_many :skills
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

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") 
  end

end
