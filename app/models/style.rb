class Style < ApplicationRecord
  belongs_to :genre
  has_and_belongs_to_many :bands

  has_and_belongs_to_many :albums

  validates :name, presence: true
end
