class Recipe < ApplicationRecord
  belongs_to :nutritionist
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :meal_plan_recipes, dependent: :destroy
  has_many :meal_plans, through: :meal_plan_recipes

  accepts_nested_attributes_for :recipe_ingredients
end
