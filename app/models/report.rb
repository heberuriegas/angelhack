class Report < ActiveRecord::Base
  attr_accessible :content, :gmaps, :latitude, :longitude, :name, :state, :user_id, :venue_id
  acts_as_gmappable :process_geocoding => false

  belongs_to :user
  belongs_to :venue
  has_many :votes

  valdates :venue_id, presence: true

  STATES = {
    0 => :revisado,
    1 => :pendiente,
    2 => :en_revision,
    3 => :recomensado,
    4 => :spam,
  }
    
  state_machine :state, initial: :pendiente do

   	STATES.each do |value,name|
        state name, value: value
    end

  	event :review do
  		transition :pendiente => :revisado
  	end

  	event :not_review do
  		transition :revisado => :pendiente
  	end

  	event :in_review do
  		transition :pendiente => :en_revision
  	end

  	event :reward do
  		transition :revisado => :recomensado
  	end

  	event :spamed do
  		transition any => :spam
  	end

  	event :not_spamed do
  		transition :spam => :pendiente
  	end

  	state :revisado
  	state :pendiente
  	state :en_revision
  	state :recomensado
  	state :spam

  end

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
