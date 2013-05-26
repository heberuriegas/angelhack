class Response < ActiveRecord::Base
  belongs_to :question
  has_many :surveys

  attr_accessible :content, :question_id
end
