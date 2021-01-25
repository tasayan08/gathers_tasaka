class Genre < ApplicationRecord
  has_many :circles
  has_many :events
  attachment :image
  validates :genre_name, presence: true
end
