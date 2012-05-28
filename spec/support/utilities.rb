def signin(hub)
  visit signin_path
  fill_in "Email",    with: hub.email
  fill_in "Password", with: hub.password
  click_button "Sign in"
  cookies[:remember_token] = hub.remember_token # Sign in when not using Capybara as well.
end

def signout
  visit signout_path
  cookies.delete(:remember_token)
end

RSpec::Matchers.define :be_accessible do |attribute|
  match do |response|
    response.class.accessible_attributes.include?(attribute)
  end
  description { "be accessible :#{attribute}" }
  failure_message_for_should { ":#{attribute} should be accessible" }
  failure_message_for_should_not { ":#{attribute} should not be accessible" }
end