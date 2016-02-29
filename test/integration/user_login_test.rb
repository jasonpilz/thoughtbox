require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  def setup
    User.create!(email: "jasonpilz@gmail.com",
                 password: "password")
  end

  test "guest user gets redirected to login page" do
    visit root_path

    assert_equal(login_path, current_path)
    assert page.has_content?("Login")
  end

  test "existing user can login" do
    visit login_path

    fill_in "Email", with: "jasonpilz@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Login"

    assert_equal(root_path, current_path)
    assert page.has_content?("Welcome, jasonpilz@gmail.com")
  end

  test "login validates password confirmation" do
    visit login_path

    fill_in "Email", with: "jasonpilz@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "notcorrect"

    click_button "Login"

    assert_equal(login_path, current_path)
    refute page.has_content?("Welcome, jasonpilz@gmail.com")
  end

end
