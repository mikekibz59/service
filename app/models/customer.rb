class Customer < ApplicationRecord
  #ensures this fields are there
  has_one :address
  accepts_nested_attributes_for :address,:allow_destroy=>true,:reject_if=>:all_blank
  validates :full_name,:email,:date_of_birth, :presence =>true
end
