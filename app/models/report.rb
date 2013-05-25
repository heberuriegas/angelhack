class Report < ActiveRecord::Base
  attr_accessible :content, :gmaps, :latitude, :longitude, :name
  belongs_to :user

  acts_as_gmappable

def gmaps4rails_address
  	address
  end

  def gmaps4rails_infowindow
      "<h4>#{user.name}</h4>Problema: #{content}"
  end

  def gmaps4rails_marker_picture
  {
   "picture" => "http://wcdn3.dataknet.com/static/resources/icons/set4/64b6bbca2da.png",
   "width" => 20,
   "height" => 20,
   "marker_anchor" => [ 5, 10],
  }
  end

  def gmaps4rails_sidebar
  "<span>#{content}</span>" #put whatever you want here
  end


end
