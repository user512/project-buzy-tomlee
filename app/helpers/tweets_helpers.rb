helpers do

  def get_username(id)
    User.find(id).username
  end

end
