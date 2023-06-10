class MealType < ApplicationRecord
  has_many :daily_meal, dependent: :nullify
end
