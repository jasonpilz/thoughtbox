require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest

  def setup
    @jason = User.create!(email: "jasonpilz@gmail.com",
                         password: "password")
  end

  test "existing user can logout" do
    visit login_path

    fill_in "Email", with: "jasonpilz@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Login"

    assert_equal(root_path, current_path)

    click_link "Sign Out"

    assert_equal(login_path, current_path)
    refute page.has_content?("Welcome, jasonpilz@gmail.com")
  end
end
