class Circle < ApplicationRecord

belongs_to :customer
belongs_to :genre
has_many :ivenmts, dependent: :destroy

end
