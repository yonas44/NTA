class Ingredient < ApplicationRecord
  belongs_to :nutritionist
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true
end
