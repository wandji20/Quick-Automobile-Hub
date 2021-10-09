class Sale < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :bought_car, class_name: "Car"
end
