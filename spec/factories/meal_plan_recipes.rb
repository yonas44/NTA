FactoryBot.define do
  factory :meal_plan_recipe do
    meal_plan { nil }
    recipe { nil }
    portion_size { rand(1..100) }
  end
end
