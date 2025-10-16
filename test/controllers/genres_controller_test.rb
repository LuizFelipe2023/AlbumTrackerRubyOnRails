require "test_helper"

class GenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    post sessions_url, params: { email_address: @user.email_address, password: "password" }

    @genre = Genre.create!(name: "Metal")
  end

  test "should get index" do
    get genres_path
    assert_response :success
  end

  test "should get new" do
    get new_genre_path
    assert_response :success
  end

  test "should create genre" do
    assert_difference("Genre.count", 1) do
      post genres_path, params: { genre: { name: "Rock" } }
    end

    assert_redirected_to genre_path(Genre.last)
  end

  test "should show genre" do
    get genre_path(@genre)
    assert_response :success
  end

  test "should get edit" do
    get edit_genre_path(@genre)
    assert_response :success
  end

  test "should update genre" do
    patch genre_path(@genre), params: { genre: { name: "Metal Updated" } }
    assert_redirected_to genre_path(@genre)
    @genre.reload
    assert_equal "Metal Updated", @genre.name
  end

  test "should destroy genre" do
    assert_difference("Genre.count", -1) do
      delete genre_path(@genre)
    end

    assert_redirected_to genres_path
  end
end
