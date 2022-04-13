FactoryBot.define do
  factory :operation do
    account
    value { rand(1..10_000) }
    operation_date { Time.now }
    operable { nil }
  end
end
