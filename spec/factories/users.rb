FactoryBot.define do

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
    country { %w[uk us es ru jp].sample }
    language { %w[en es ru jp].sample }
  end
end
