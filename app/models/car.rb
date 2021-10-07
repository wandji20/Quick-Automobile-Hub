class Car < ApplicationRecord
  has_many :ratings
  belongs_to :category

  validates :manufacturer, presence: true, length: { in: 3..30 }
  validates :year, presence: true, length: { is: 4}
  validates :mileage, presence: true
  validates :location, presence: true, length: { in: 3..30 }
  validates :price, presence: true
end
# user = User.new(first_name:'Wandji', last_name: 'Bertrand', user_name:'Wanji Auto', email:'wandji@email',password:'111111', password_confirmation:'111111' )