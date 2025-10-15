class Album < ApplicationRecord
  has_and_belongs_to_many :bands
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :styles

  has_one_attached :cover  

  validates :title, presence: true
  validates :release_year, presence: true

  has_many :album_favorites
  has_many :favorited_by_users, through: :album_favorites, source: :user

  has_many :favorites, as: :favoritable, dependent: :destroy

  has_many :favorite_albums
  has_many :favorited_by_users, through: :favorite_albums, source: :user

  has_many :reviews 

end
