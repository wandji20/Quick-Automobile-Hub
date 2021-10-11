class User < ApplicationRecord
  has_many :ratings

  has_many :cars

  # has_many :hires, foreign_key: :hirer_id
  # has_many :hired_cars, through: :hires, class_name: "User"

  has_many :pending_hires, -> { where status: 'pending' }, foreign_key: :hirer_id, class_name: 'Hire'
  has_many :pending_hired_cars, through: :pending_hires, source: :hired_car

  has_many :confirmed_hire_requests, -> { where status: 'accepted' }, foreign_key: :hirer_id, class_name: 'Hire'
  has_many :hired_cars, through: :confirmed_hire_requests

  has_many :declined_car_requests, -> { where status: 'declined' }, class_name: 'Hire', foreign_key: :hirer_id
  has_many :declined_cars, through: :declined_car_requests, source: :hired_car

  has_many :sales, foreign_key: :buyer_id
  has_many :bought_cars, through: :sales, source: :bought_car

  has_secure_password

  validates :user_name, uniqueness: true
end
