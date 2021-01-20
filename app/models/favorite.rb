class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :circle
  belongs_to :event
  
end
