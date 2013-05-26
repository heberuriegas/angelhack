# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  report_id    :integer
#  user_id      :integer
#  calification :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ActiveRecord::Base
  belongs_to :report
  belongs_to :user
  attr_accessible :calification, :user_id, :report_id
end
