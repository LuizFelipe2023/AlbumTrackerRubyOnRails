require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save a user without name, username, email, and password" do
    user = User.new
    assert_not user.save, "Saved a user with empty fields"
  end

  test "should not save a user with name less than 2 characters" do
    user = User.new(
      name: 'u',
      email_address: "test@email.com",
      username: "test",
      password: "test123",
      password_confirmation: "test123"
    )
    assert_not user.save, "Saved a user with name less than 2 characters"
  end

end
