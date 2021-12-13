FactoryBot.define do
  factory :recipe do
    user
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    state { "published" }
    published_at { 1.day.ago }

    transient do
      comments_count { 3 }
    end
    trait(:with_comments) do
      after(:build) do |model, evaluator|
        evaluator.comments_count.times { model.comments.build(attributes_for(:comment)) }
      end
    end
  end
end
