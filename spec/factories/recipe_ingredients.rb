FactoryBot.define do
  factory :recipe_ingredient do
    recipe { nil }
    ingredient { nil }
    quantity { rand(1..100) }
  end
end
