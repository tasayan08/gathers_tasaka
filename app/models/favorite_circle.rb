class FavoriteCircle < ApplicationRecord
  belongs_to :customer
  belongs_to :circle
end
