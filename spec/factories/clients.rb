FactoryBot.define do
  factory :client do
    user_id { nil }
    profile_pic { Faker::Name.name }
  end
end
