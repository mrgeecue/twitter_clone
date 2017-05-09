class User < ApplicationRecord
  has_secure_password
  has_many :posts
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates_format_of :full_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :full_name, presence: true, :length => { :minimum => 4 }
  validates :password, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
