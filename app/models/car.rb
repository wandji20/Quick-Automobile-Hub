class Car < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :manufacturer, presence: true, length: { in: 3..30 }
  validates :year, presence: true, length: 4
  validates :mileage, presence: true
  validates :location, presence: true, length: { in: 3..30 }
  validates :price, presence: true
end
