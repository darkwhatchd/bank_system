require "rails_helper"

describe "the signin process", type: :feature do
  let!(:user) { create(:user) }
  let!(:account) { create(:account, user: user) }
  it "signs the user in successfully with a valid email and password" do
    sign_in_with user.email, "123456"
    user_sees_notice("Signed in successfully.")
  end
end
