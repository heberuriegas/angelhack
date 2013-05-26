# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :string(255)
#  latitude   :float
#  longitude  :float
#  gmaps      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :string(255)      default("1")
#  user_id    :integer          not null
#  venue_id   :integer          not null
#

require 'spec_helper'

describe Report do
  pending "add some examples to (or delete) #{__FILE__}"
end
