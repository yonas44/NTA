FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    description { Faker::Food.description }
    picture { 'picture link here' }
    nutritionist { nil }
    instructions { %w[first second third] }
  end
end
