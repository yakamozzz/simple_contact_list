require_relative 'application_record'


class Number < ApplicationRecord
  belongs_to :contact
end