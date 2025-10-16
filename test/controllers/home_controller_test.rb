require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do 
    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    post sessions_url, params: { email_address: @user.email_address, password: "password" }
  end 

  test "should get index" do
    get home_index_path
    assert_response :success
  end
end
