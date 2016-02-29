require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest

  test "new user can signup" do
    visit login_path

    assert_difference 'User.count', 1 do
      click_link "Sign Up"

      fill_in "Email", with: "jasonpilz@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_button "Create Account"
    end

    assert_equal(root_path, current_path)
  end

  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, user: { email: "",
                               password: "password",
                               password_confirmation: "" }
    end
  end
end
