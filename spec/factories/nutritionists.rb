FactoryBot.define do
  factory :nutritionist do
    user_id { nil }
    profile_pic { Faker::Name.name }
  end
end
