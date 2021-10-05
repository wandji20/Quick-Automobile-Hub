class User < ApplicationRecord
  validates :email, confirmation: true
  validates :first_name, presence: true, length: { in: 3..30 }
  validates :last_name, presence: true, length: { in: 3..30 }
  validates :location, presence: true, length: { in: 3..30 }
  validates :user_name, presence: true, length: { in: 3..30 }, uniqueness: true
  validates :telephone, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
