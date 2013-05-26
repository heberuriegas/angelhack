class Contact < ActiveRecord::Base
  belongs_to :type
  belongs_to :venue
  attr_accessible :title, :type

  def type= type
    self.type_id = ContactType.where(title: type).first_or_create.id
  end
end
