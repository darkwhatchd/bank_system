module Features
  def sign_in_with(email, password)
    visit "/users/sign_in"
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

  def user_sees_notice(text)
    expect(page).to have_content(text)
  end
end
