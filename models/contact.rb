require_relative 'application_record'

class Contact < ApplicationRecord
	validates :name, presence: true
	has_many :numbers




end

class Numbers < ApplicationRecord
  belongs_to :contact
end





