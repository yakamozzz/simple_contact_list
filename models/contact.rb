require_relative 'application_record'

class Contact < ApplicationRecord
	validates :name, presence: true
	has_many :numbers




end






