class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
end
