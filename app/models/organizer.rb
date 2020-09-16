class Organizer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exhibitions
  has_many :events
  
  with_options presence: true, format: { with: /\A.+\z/ } do
    validates :name
    validates :company_name
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i }

end
