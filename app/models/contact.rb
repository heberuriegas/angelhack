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

class Contact < ActiveRecord::Base
  belongs_to :type
  belongs_to :venue
  attr_accessible :title, :type

  def type= type
    self.type_id = ContactType.where(title: type).first_or_create.id
  end
end
