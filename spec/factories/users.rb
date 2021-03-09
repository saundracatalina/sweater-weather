FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    api_key { 'test_api_key' }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
