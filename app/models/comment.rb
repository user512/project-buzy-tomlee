class Comment < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users
  belongs_to :post
end
