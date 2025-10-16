class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }

  validates :title, uniqueness: { scope: :user_id, message: "já existe um tópico com esse título" }
end
