FactoryBot.define do
  factory :meal_plan do
    title { Faker::Food.dish }
    description { Faker::Lorem.sentence }
    nutritionist { nil }
    client { nil }
  end
end
