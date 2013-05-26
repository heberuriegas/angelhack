# == Schema Information
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  image         :string(255)
#  description   :text
#  latitude      :float
#  longitude     :float
#  address       :string(255)
#  postalcode    :string(255)
#  city          :string(255)
#  state         :string(255)
#  country       :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  external_type :string(255)
#  external_id   :string(255)
#

require 'spec_helper'

describe Venue do
  pending "add some examples to (or delete) #{__FILE__}"
end
