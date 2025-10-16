class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one_attached :avatar

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :name, presence: true, length: {minimum:2, maximum:255}
  validates :username, presence: true, length: {minimum:2, maximum:255}

  has_many :favorite_bands, dependent: :destroy
  has_many :favorite_albums, dependent: :destroy
  has_many :favorited_bands, through: :favorite_bands, source: :band
  has_many :favorited_albums, through: :favorite_albums, source: :album

  has_many :reviews, dependent: :destroy
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :topics, dependent: :destroy

  enum :role, { user: 0, admin: 1 }

  def admin?
    read_attribute(:role) == "admin"
  end
end
