class User < ApplicationRecord
  # --------------- Friendly Id ---------------
  attr_writer :login
  extend FriendlyId
  friendly_id :last_name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: " : use a valide email format" }

  has_one :cart    
  has_many :orders
  has_one_attached :profile_picture     

  # We launch a method after the creation of the user
  after_create :assign_cart

  # The method assign_cart automatically creates a cart assigned to the used
  def assign_cart 
  	Cart.create(user_id: self.id)
  end 

  def login
    @login || self.first_name || self.last_name || self.email
  end

end
