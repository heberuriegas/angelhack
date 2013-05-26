# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  description :text
#  report_id   :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :report
  belongs_to :user
  attr_accessible :description, :report_id, :user_id
end
