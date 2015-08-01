class User < ActiveRecord::Base
	has_many :tweets

  def get_user_image
  	self.update_attributes({
  		:photo_url => "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)} "
  		})
  end

end
