class Venue < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :contacts

  attr_accessible :address, :city, :country, :description, :image, :latitude, :longitude, :name, :postalcode, :state
end
