FactoryBot.define do
  factory :daily_meal do
    nutritionist { nil }
    meal_plan { nil }
    meal_type { nil }
    recipe { nil }
    meal_date { Date.today }
  end
end
