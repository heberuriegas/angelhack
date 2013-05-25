class Report < ActiveRecord::Base
  attr_accessible :content, :gmaps, :latitude, :longitude, :name
end
