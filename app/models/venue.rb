# == Schema Information
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  image         :string(255)
#  description   :text
#  latitude      :float
#  longitude     :float
#  address       :string(255)
#  postalcode    :string(255)
#  city          :string(255)
#  state         :string(255)
#  country       :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  external_type :string(255)
#  external_id   :string(255)
#

class Venue < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :contacts
  has_many :reports
  belongs_to :user
  after_touch { tire.update_index }

  include Tire::Model::Search
  include Tire::Model::Callbacks
  include Gmaps4rails::ActsAsGmappable

  index_name INDEX_NAME

  attr_accessible :address, :city, :country, :description, :image, :latitude, :longitude, :name, :postalcode, :state, :external_id, :external_type, :categories

  acts_as_gmappable :process_geocoding => false

  PER_PAGE = 30
  SEARCH_DISTANCE = '15km'

  mapping do
    indexes :id,                  type: 'integer',          index: 'not_analyzed'
    indexes :lat_lon,             type: 'geo_point'
    indexes :address,             type: 'string'
    indexes :city,                type: 'string'
    indexes :name,                type: 'string'
    indexes :description,         type: 'string'
    indexes :reports_count,       type: 'integer'
    indexes :categories do
      indexes :title,             type: 'string' 
    end
  end

  def lat_lon
    "#{self.latitude},#{self.longitude}"
  end

  def to_indexed_json
    to_json({
      only: [:id, :address, :city, :name, :description],
      methods: [:lat_lon, :reports_count],
      include: {
        categories: {
          only: [:title]
        }
      }
    })
  end

  def self.search(params={})
    options = {:page => (params[:page] || 1), :per_page=> (params[:per_page] || PER_PAGE), load: params[:load]}

    self.nearby(params[:lat_lon]) if params[:lat_lon].present?
    params[:distance] ||= SEARCH_DISTANCE    
    
    tire.search(options) do
      params[:q].present? ? query { string "*#{params[:q]}*" } : query { all } #TODO: Add analyzer

      filter :geo_distance, lat_lon: params[:lat_lon], distance: params[:distance] if params[:lat_lon].present?

      sorts = []
      # Sort
      unless params[:orders].blank?
        orders = params[:orders].sort_by{|k,v| v}
        
        orders.each do |order|
          sorts << {'reports_count' => 'desc'} if order.to_s == 'reports_count'
        end
      end

      sorts << {'id' => 'desc'}
      sort { by sorts }
    end
  end

  def reports_count
    self.reports.size
  end

  def gmaps4rails_infowindow
    "Venue: #{name}"
  end

  def gmaps4rails_marker_picture
    {
     "picture" => "http://wcdn3.dataknet.com/static/resources/icons/set4/64b6bbca2da.png",
     "width" => 20,
     "height" => 20,
     "marker_anchor" => [ 5, 10],
    }
  end

  private
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
