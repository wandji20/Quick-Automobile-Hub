class User < ApplicationRecord
  has_many :ratings

  has_many :hires
  has_many :hiring_cars, foreign_key: :hiree_id

  has_many :hired_cars, foreign_key: :hirer_id

  has_secure_password
end
