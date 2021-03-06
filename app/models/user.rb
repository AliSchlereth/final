class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :links

  has_secure_password
  validates_confirmation_of :password
end
