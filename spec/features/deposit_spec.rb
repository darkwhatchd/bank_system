require "rails_helper"

describe "the deposit process", type: :feature do
  let(:user) { create(:user) }
  let(:account) { create(:account, user: user) }

  it "deposit cash in account" do
    visit "/"
    click_on "Cash Deposit"
    fill_in "Account", with: account.id
    fill_in "Value", with: 10
    click_button "Send"
    user_sees_notice("Cash deposit success!")
  end
end
