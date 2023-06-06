class MealPlan < ApplicationRecord
  belongs_to :client
  belongs_to :nutritionist
  has_many :meal_plan_recipies, dependent: :destroy
end
