class MealPlan < ApplicationRecord
  belongs_to :client
  belongs_to :nutritionist
  has_many :meal_plan_recipes, dependent: :destroy
  has_many :recipes, through: :meal_plan_recipes
  has_many :daily_meals, dependent: :destroy
end
