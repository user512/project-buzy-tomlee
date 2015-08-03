require 'bcrypt'
class User < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts
  validates :username, uniqueness: :true, presence: :true
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:uesr])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      given_token
    else
      redirect_to home_url
    end
  end
end
