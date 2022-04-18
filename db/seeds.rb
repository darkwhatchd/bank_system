# Users

user_1 = User.create!(name: "Test 01", email: "test01@test.com", document: "000.000.000-00", password: 123456, password_confirmation: 123456)
user_2 = User.create!(name: "Test 02", email: "test02@test.com", document: "000.000.000-01", password: 123456, password_confirmation: 123456)
user_3 = User.create!(name: "Test 03", email: "test03@test.com", document: "000.000.000-02", password: 123456, password_confirmation: 123456)

# Accounts
Account.create!(account_balance: 5000, status: :active, user_id: user_1.id)
Account.create!(account_balance: 5000, status: :active, user_id: user_2.id)
Account.create!(account_balance: 5000, status: :active, user_id: user_3.id)
account_1 = user_1.account
account_2 = user_2.account
account_3 = user_3.account

# Deposits

3.times do
  deposit_1 = account_1.deposits.create!
  deposit_2 = account_2.deposits.create!
  deposit_3 = account_3.deposits.create!
  Operation.create!(value: 1000, operation_date: Time.now, operable: deposit_1)
  Operation.create!(value: 1000, operation_date: Time.now, operable: deposit_2)
  Operation.create!(value: 1000, operation_date: Time.now, operable: deposit_3)
end

# Withdrawals

3.times do
  withdrawal_1 = account_1.withdrawals.create!
  withdrawal_2 = account_2.withdrawals.create!
  withdrawal_3 = account_3.withdrawals.create!
  Operation.create!(value: 100, operation_date: Time.now, operable: withdrawal_1)
  Operation.create!(value: 100, operation_date: Time.now, operable: withdrawal_2)
  Operation.create!(value: 100, operation_date: Time.now, operable: withdrawal_3)
end

# Transfers

3.times do
  Transfer.create!(value: 500, account_id: account_1.id, destiny_account_id: account_2.id, transfer_date: Time.now)
  Transfer.create!(value: 500, account_id: account_1.id, destiny_account_id: account_3.id, transfer_date: Time.now)
  Transfer.create!(value: 500, account_id: account_2.id, destiny_account_id: account_1.id, transfer_date: Time.now)
  Transfer.create!(value: 500, account_id: account_2.id, destiny_account_id: account_3.id, transfer_date: Time.now)
  Transfer.create!(value: 500, account_id: account_3.id, destiny_account_id: account_1.id, transfer_date: Time.now)
  Transfer.create!(value: 500, account_id: account_3.id, destiny_account_id: account_2.id, transfer_date: Time.now)
end
