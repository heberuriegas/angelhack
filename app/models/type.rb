# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Type < ActiveRecord::Base
  attr_accessible :title, :type
end
