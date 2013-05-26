class Comment < ActiveRecord::Base
  belongs_to :report
  belongs_to :user
  attr_accessible :description
end
