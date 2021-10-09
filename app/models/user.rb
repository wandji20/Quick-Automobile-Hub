class User < ApplicationRecord
  has_many :ratings

  has_many :cars

  # has_many :hires, foreign_key: :hirer_id
  # has_many :hired_cars, through: :hires, class_name: "User"

  has_many :pending_hires, -> { where status: 'pending' }, foreign_key: :hirer_id, class_name: "Hire"
  has_many :pending_hired_cars, through: :pending_hires, source: :hired_car

  has_many :confirmed_hire_requests, -> { where status: 'accepted'}, foreign_key: :hirer_id, class_name: 'Hire'
  has_many :hired_cars, through: :confirmed_hire_requests

  has_many :declined_car_requests, -> { where status: 'declined' }, class_name: 'Hire', foreign_key: :hirer_id
  has_many :declined_cars, through: :declined_car_requests, source: :hired_car

  has_many :sales, foreign_key: :buyer_id
  has_many :bought_cars, through: :sales, class_name: "Car"

  # has_many :hired_cars, foreign_key: :hirer_id

  has_secure_password
end

# user = User.create(first_name:'Wandji', last_name: 'Bertrand', user_name:'Wanji Auto', email:'wandji@email',password:'111111', password_confirmation:'111111' )

# car = user.cars.new( {manufacturer: "Toyota", year: '2012', mileage: 200000 , location: 'Buea', status: 'hire', price: 11000000, category_id: 1, model: 'Camry'})
