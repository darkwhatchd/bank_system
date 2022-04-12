FactoryBot.define do
  factory :account do
    account_balance { rand(0..10_000) }
    status { "active" }
    user
  end
end
