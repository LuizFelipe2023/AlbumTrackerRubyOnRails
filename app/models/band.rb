class Band < ApplicationRecord
  belongs_to :genre
  has_and_belongs_to_many :styles
  has_one_attached :logo

  has_and_belongs_to_many :albums
  validates :name, :country, presence: true
  has_many :favorites, as: :favoritable, dependent: :destroy

  has_many :favorite_bands
  has_many :favorited_by_users, through: :favorite_bands, source: :user
end
