require "rails_helper"

describe "the withdrawal process", type: :feature do
  let!(:user) { create(:user) }
  let!(:account) { create(:account, user: user, account_balance: 1000) }

  it "withdrawal cash in account" do
    sign_in_with user.email, "123456"
    visit "/withdrawals/new"
    fill_in "Value", with: 10
    click_button "Send"
    user_sees_notice("Value: R$ 10")
  end
end
