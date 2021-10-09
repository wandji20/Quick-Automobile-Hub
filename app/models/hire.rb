class Hire < ApplicationRecord
  belongs_to :hirer, class_name: "User"
  belongs_to :hired_car, class_name: "Car"
end
