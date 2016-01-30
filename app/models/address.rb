class Address < ActiveRecord::Base
  validates_presence_of :street
  validates_presence_of :number
end
