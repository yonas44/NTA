class MealPlan < ApplicationRecord
  belongs_to :client
  belongs_to :nutritionist
  has_many :daily_meals, dependent: :destroy
end
