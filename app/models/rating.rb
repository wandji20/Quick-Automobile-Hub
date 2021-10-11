class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :value, presence: true
end
