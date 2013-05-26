# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  type_id    :integer
#  venue_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Contact do
  pending "add some examples to (or delete) #{__FILE__}"
end
