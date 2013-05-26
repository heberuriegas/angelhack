class ContactType < Type
  has_many :contacts, foreign_key: :type_id
end
