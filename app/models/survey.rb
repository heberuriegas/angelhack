class Survey < ActiveRecord::Base
  belongs_to :report
  belongs_to :response
  
  attr_accessible :report_id, :response_id
end
