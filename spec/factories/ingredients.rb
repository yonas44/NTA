FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.unique.ingredient }
    nutritionist { nil }
    picture { 'picture link here' }
  end
end
