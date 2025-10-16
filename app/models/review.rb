class Review < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :user_id, uniqueness: { scope: :album_id, message: "já fez uma review para este álbum" }
end
