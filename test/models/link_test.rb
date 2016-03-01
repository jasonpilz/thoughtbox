require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  valid_params = { title: "Turing today",
                   url: "http://today.turing.io/outlines/2016-02-29/"}

  should belong_to(:user)

  test "it is valid with correct params" do
    link = Link.new(valid_params)

    assert link.valid?
  end

  test "should have a valid url" do
    link = Link.new({ title: "hello",
                      url: "notavalidurl" })

    refute link.valid?
  end
end
