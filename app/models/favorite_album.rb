class FavoriteAlbum < ApplicationRecord
  belongs_to :user
  belongs_to :album
  
  validates :user_id, uniqueness: { scope: :album_id }
end