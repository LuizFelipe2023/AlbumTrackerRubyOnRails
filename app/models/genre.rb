class Genre < ApplicationRecord
  has_many :styles, dependent: :destroy
  has_many :bands, dependent: :destroy

  has_and_belongs_to_many :albums

  validates :name, presence: true, uniqueness: true
end
