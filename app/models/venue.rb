class Venue < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :contacts
  has_many :reports

  attr_accessible :address, :city, :country, :description, :image, :latitude, :longitude, :name, :postalcode, :state, :external_id, :external_type, :categories

  def reports_count
    self.reports.size
  end

  def self.nearby lat_lon
    @@foursquare ||= Foursquare::Base.new(ENV['FOURSQUARE_ACCESS_TOKEN'])
    @@foursquare.venues.search(ll: lat_lon)['nearby'].map do |venue|
      venues = Venue.where(external_type: 'foursquare', external_id: venue.id)
      if venues.present?
        venues.first
      else
        categories = []
        venue.categories.each do |category|
          categories = Category.where(title: category.parents)
        end
        categories = Category.where(title: 'Other') if categories.empty?

        venue = Venue.create(name: venue.name, address: venue.location.address, latitude: venue.location.lat.round(4), longitude: venue.location.lng.round(4), city: venue.location.city, state: venue.location.state, country: venue.location.country, external_type: 'foursquare', external_id: venue.id)
        venue.categories = categories
        venue
      end
    end
  end
end
