class Circle < ApplicationRecord

belongs_to :customer
belongs_to :genre
has_many :ivenmts, dependent: :destroy
has_many :review, dependent: :destroy



def self.search_for(content)
  if content == 'perfect'
    Circle.where(circle_name: content)
  else
    Circle.where('circle_name LIKE ?', '%'+content+'%')
  end
end


end
