FactoryBot.define do
  factory :transfer do
    account
    destiny_account { account }
    transfer_date { Time.now }
    value { rand(1..10_000) }
  end
end
