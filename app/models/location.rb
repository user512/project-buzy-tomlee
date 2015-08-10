class Location < ActiveRecord::Base

  geocoded_by :address
  belongs_to :city
end
