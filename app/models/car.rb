class Car < ApplicationRecord
  has_many :ratings
  belongs_to :category

  belongs_to :user

  has_many :incoming_hire_requests, -> { where status: 'pending' }, foreign_key: :hired_car_id, class_name: 'Hire'
  has_many :pending_hirers, through: :incoming_hire_requests, source: :hirer

  has_many :confirmed_hire_requests, -> { where status: 'accepted' }, class_name: 'Hire', foreign_key: :hired_car_id
  has_many :hirers, through: 'confirmed_hire_requests', source: :hirer

  has_one :sale, foreign_key: :bought_car_id
  has_one :buyer, through: :sale, class_name: 'User'

  scope :hiring_cars, -> { where(status: 'hire')}
  scope :selling_cars, -> { where(status: 'sale')}

  validates :manufacturer, presence: true, length: { in: 3..30 }
  validates :year, presence: true, length: { is: 4 }
  validates :mileage, presence: true
  validates :location, presence: true, length: { in: 3..30 }
  validates :price, presence: true
end
