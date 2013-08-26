module UserMacros
  def user_login
    visit root_path
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button('login-submit')
  end
end