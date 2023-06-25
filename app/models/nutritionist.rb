class Nutritionist < ApplicationRecord
  belongs_to :user
  has_many :clients, dependent: :nullify
  has_many :meal_plans, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :daily_meals, dependent: :destroy
end
