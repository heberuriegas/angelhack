class Report < ActiveRecord::Base
  attr_accessible :content, :gmaps, :latitude, :longitude, :name
  #belongs_to :user

  acts_as_gmappable :process_geocoding => false


  def gmaps4rails_infowindow
      "Problema: #{content}"
  end

  def gmaps4rails_marker_picture
  {
   "picture" => "http://wcdn3.dataknet.com/static/resources/icons/set4/64b6bbca2da.png",
   "width" => 20,
   "height" => 20,
   "marker_anchor" => [ 5, 10],
  }
  end

end
