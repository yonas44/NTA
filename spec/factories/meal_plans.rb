FactoryBot.define do
  factory :meal_plan do
    title { Faker::Food.dish }
    start_date { Date.today }
    end_date { Date.tomorrow }
    nutritionist { nil }
    client { nil }
  end
end
