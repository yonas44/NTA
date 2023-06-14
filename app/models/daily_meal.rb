class DailyMeal < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :recipe
  belongs_to :nutritionist
  belongs_to :meal_type
end
