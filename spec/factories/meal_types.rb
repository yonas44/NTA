meal_types = %w[breakfast lunch dinner]

FactoryBot.define do
  factory :meal_type do
    name { meal_types[rand { 0..2 }] }
  end
end
