class User < ApplicationRecord
  validates_presence_of :email, :password_digest, :password_confirmation
  validates_uniqueness_of :email

  has_secure_token :auth_token
  has_secure_password
end
