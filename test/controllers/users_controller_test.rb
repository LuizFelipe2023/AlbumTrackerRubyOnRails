require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
    post sessions_url, params: { email_address: @user.email_address, password: "password" }
  end

  test "should get index when logged in" do
    get users_path
    assert_response :success
  end

  test "should get show when logged in" do
    get user_path(@user)
    assert_response :success
  end

  test "should get new without login" do
    delete sessions_path 
    get new_user_path
    assert_response :success
  end

  test "should create user without login" do
    delete sessions_path 

    assert_difference("User.count", 1) do
      post users_path, params: {
        user: {
          name: "New User",
          username: "newuser",
          email_address: "new@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end

    assert_redirected_to new_sessions_path
    assert_equal "User was successfully created. Please log in.", flash[:notice]
  end

  test "should get edit when logged in" do
    get edit_user_path(@user)
    assert_response :success
  end

  test "should update user when logged in" do
    patch user_path(@user), params: { user: { name: "Updated Name" } }
    assert_redirected_to edit_user_path(@user)
    assert_equal "User was successfully updated.", flash[:notice]
    @user.reload
    assert_equal "Updated Name", @user.name
  end

  test "should destroy user when logged in" do
    assert_difference("User.count", -1) do
      delete user_path(@user)
    end
    assert_redirected_to users_path
    assert_equal "User was successfully deleted.", flash[:notice]
  end
end
