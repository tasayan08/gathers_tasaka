class Genre < ApplicationRecord
  has_many :circles
  validates :genre_name, presence: true
end
