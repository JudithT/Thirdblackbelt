class User < ApplicationRecord
  has_secure_password
  has_many :songs
  has_many :adds, dependent: :destroy
  has_many :songs_added, through: :adds, source: :song
  validates :firstname, :lastname, :email, :password, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
