FactoryBot.define do
  factory :comment do
    association(:commentable, factory: :recipe)
    content { Faker::Lorem.sentence }
  end
end
