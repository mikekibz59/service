class User < ApplicationRecord
  #authenticate using bycrypt
  has_secure_password
  #validates that the following must be present 
  validates :name,:email,:password,:password_confirmation,:presence =>true
end
