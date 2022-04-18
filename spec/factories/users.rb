FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    document { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    email { Faker::Internet.email }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
