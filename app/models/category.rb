class Category < ActiveRecord::Base
  attr_accessible :image, :title

  has_and_belongs_to_many :venues
end
