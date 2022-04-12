FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    document { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
  end
end
