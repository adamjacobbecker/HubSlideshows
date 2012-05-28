def signin(hub)
  visit signin_path
  fill_in "Email",    with: hub.email
  fill_in "Password", with: hub.password
  click_button "Sign in"
  cookies[:remember_token] = hub.remember_token # Sign in when not using Capybara as well.
end
