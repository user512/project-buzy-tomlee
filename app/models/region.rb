class Region < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cities
  has_many :locations, through: :cities
end
