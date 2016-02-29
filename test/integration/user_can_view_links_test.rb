require 'test_helper'

class UserCanViewLinksTest < ActionDispatch::IntegrationTest
  def setup
    jason = User.create!(email: "jasonpilz@gmail.com",
                         password: "password")
    jason.links.create(url: "http://today.turing.io/outlines/2016-02-29/",
                       title: "today")
  end

  test "user can view links" do
    visit login_path

    fill_in "Email", with: "jasonpilz@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Login"

    assert_equal(root_path, current_path)
    assert page.has_content?("today")
    assert page.has_content?("http://today.turing.io/outlines/2016-02-29/")
  end
end
