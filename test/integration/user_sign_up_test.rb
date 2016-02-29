require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest
  test "guest user gets redirected to login page" do
    visit root_path

    assert_equal(login_path, current_path)
    assert page.has_content?("Sign Up")
  end
end
