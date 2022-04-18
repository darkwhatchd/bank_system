require "rails_helper"

describe "the sign up process", type: :feature do
  it "sign up the user" do
    visit "/users/sign_up"
    fill_in "Name", with: "testtt"
    fill_in "Document", with: Faker::IDNumber.brazilian_citizen_number(formatted: true)
    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    user_sees_notice("Welcome! You have signed up successfully.")
  end
end
