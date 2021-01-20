class Event < ApplicationRecord
  belongs_to :circle
  belongs_to :customer
  has_many :favorite_events, dependent: :destroy
  
  def favorited_by?(customer)
   favorites.where(customer_id: customer.id).exists?
  end


  def self.search_for(content)
    if content == 'perfect'
      Event.where(title: content)
    else
      Event.where('title LIKE ?', '%'+content+'%')
    end
  end

end

