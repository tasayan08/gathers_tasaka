class Circle < ApplicationRecord

belongs_to :customer
belongs_to :genre
has_many :events, dependent: :destroy
has_many :review, dependent: :destroy
has_many :favorite_circles, dependent: :destroy

def favorited_by?(x)
  favorite_circles.where(customer_id: x).present?
end





def self.search_for(content)
  if content == 'perfect'
    Circle.where(circle_name: content)
  else
    Circle.where('circle_name LIKE ?', '%'+content+'%')
  end
end


end
