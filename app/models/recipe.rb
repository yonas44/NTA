class Recipe < ApplicationRecord
  belongs_to :nutritionist
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients, dependent: :destroy
  has_many :meal_plan_recipes, dependent: :destroy

  accepts_nested_attributes_for :recipe_ingredients
end
