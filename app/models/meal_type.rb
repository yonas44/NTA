class MealType < ApplicationRecord
  has_many :daily_meals, dependent: :nullify
end
