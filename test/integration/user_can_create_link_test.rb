require 'test_helper'

class UserCanCreateLinkTest < ActionDispatch::IntegrationTest

  test "user can see a form to enter a new link" do
    login_user

    fill_in "Title", with: "sweet link"
    fill_in "Url", with: "https://getbootstrap.com/components/#panels"

    click_button "Create"

    assert page.has_content?("sweet link: https://getbootstrap.com/components/#panels")
  end

end
