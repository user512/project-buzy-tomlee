class City < ActiveRecord::Base
  # Remember to create a migration!
  has_many :locations
end
