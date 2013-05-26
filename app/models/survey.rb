# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  report_id  :string(255)
#  resp_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Survey < ActiveRecord::Base
  belongs_to :report
  belongs_to :response
  
  attr_accessible :report_id, :response_id
end
