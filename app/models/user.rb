class User < ActiveRecord::Base
  has_and_belongs_to_many :photos

  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password
  validates_uniqueness_of :name



  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(name, password)
    user = User.where(name: name).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end
