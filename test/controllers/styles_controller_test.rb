require "test_helper"

class StylesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    post sessions_url, params: { email_address: @user.email_address, password: "password" }
    @genre = Genre.create!(name: "Metal")
    @style = Style.create!(name: "Heavy Metal", genre: @genre)
  end

  test "should get index" do
    get styles_path
    assert_response :success
  end

  test "should get show" do
    get style_path(@style)
    assert_response :success
  end

  test "should get new" do
    get new_style_path
    assert_response :success
  end

  test "should get edit" do
    get edit_style_path(@style)
    assert_response :success
  end
end
