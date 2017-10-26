class User < ApplicationRecord
  #authenticate using bycrypt
  has_secure_password
end
