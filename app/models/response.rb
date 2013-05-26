# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  quest_id   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ActiveRecord::Base
  belongs_to :question
  has_many :surveys

  attr_accessible :content, :question_id
end
