class Category < ApplicationRecord
  has_many :cars

  validates :name, presence: true, length: { in: 3..30 }, uniqueness: true
end
