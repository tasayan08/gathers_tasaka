class Event < ApplicationRecord
  belongs_to :circle
  belongs_to :customer
  belongs_to :genre
  has_many :favorite_events, dependent: :destroy
  attachment :image

def favorited_by?(x)
  favorite_events.where(customer_id: x).present?
end


  def self.search_for(content)
    if content == 'perfect'
      Event.where(title: content)
    else
      Event.where('title LIKE ?', '%'+content+'%')
    end
  end

end

