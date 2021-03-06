class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :circles, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :favorite_circles, dependent: :destroy
  has_many :favorite_events, dependent: :destroy
  attachment :image


  validates :name, presence: true

  enum customer_status: {Available: true, Invalid: false}

  def active_for_authentication?
    super && (self.customer_status === "Available")
  end

end
