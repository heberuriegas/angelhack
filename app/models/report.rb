class Report < ActiveRecord::Base
  attr_accessible :content, :state, :user_id, :venue_id

  belongs_to :user
  belongs_to :venue, touch: true
  has_many :votes
  has_many :comments
  has_many :surveys

  validates :venue_id, presence: true
  validates :user_id, presence: true

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
  
end
