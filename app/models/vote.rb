class Vote < ActiveRecord::Base
  belongs_to :report
  belongs_to :user
  attr_accessible :calification, :user_id
end
