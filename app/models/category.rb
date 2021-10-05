class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 3..30 }, uniqueness: true
end
