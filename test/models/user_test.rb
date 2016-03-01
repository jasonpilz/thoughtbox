require 'test_helper'

class UserTest < ActiveSupport::TestCase
  valid_params = { email: "jasonpilz@gmail.com",
                   password: "password",
                   password_confirmation: "password" }

  should have_many(:links)

  test "it is valid with correct params" do
    user = User.new(valid_params)
    assert user.valid?
  end

  test "it is invalid without unique email" do
    user = User.create(valid_params)
    user_with_same_email = User.new(valid_params)

    assert user.valid?
    refute user_with_same_email.valid?
  end
end
