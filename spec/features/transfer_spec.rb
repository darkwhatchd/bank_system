# require "rails_helper"

# describe "the transfer process", type: :feature do
#   let!(:first_user) { create(:user) }
#   let!(:first_account) { create(:account, user: first_user, account_balance: 1000) }
#   let!(:destinatary) { create(:user) }
#   let!(:destinatary_account) { create(:account, user: destinatary, account_balance: 0) }

#   it "transfer cash in account to another" do
#     sign_in_with first_user.email, "123456"

#     visit "/transfers/new"
#     fill_in "Destiny account", with: destinatary_account.id
#     fill_in "Value", with: 10
#     click_button "Transfer"
#     user_sees_notice("Transfer Data")
#     user_sees_notice("Destiny Account: #{destinatary_account.id}")
#     user_sees_notice("Destiny Username: #{destinatary.name}")
#   end
# end
