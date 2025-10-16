class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 150 }
  validates :content, presence: true, length: { minimum: 10, maximum: 5000 }
end
