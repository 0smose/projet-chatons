class User < ApplicationRecord
  # --------------- Friendly Id ---------------
  extend FriendlyId
  friendly_id :email, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart    
  has_many :orders
  has_one_attached :profile_picture     

  # We launch a method after the creation of the user
  after_create :assign_cart

  # The method assign_cart automatically creates a cart assigned to the used
  def assign_cart 
  	Cart.create(user_id: self.id)
  end 
end
