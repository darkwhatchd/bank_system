FactoryBot.define do
  factory :statement do
    start_date { 1.day.ago }
    finish_date { Time.now }
    account
  end
end
