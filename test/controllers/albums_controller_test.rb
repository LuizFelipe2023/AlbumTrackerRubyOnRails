require "test_helper"

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(name: "test user", username: "test", email_address: "test@example.com", password: "password", password_confirmation: "password")
    @genre = Genre.create!(name: "Metal")
    @style = Style.create!(name: "Heavy Metal", genre: @genre)
    @band = Band.create!(name: "Metallica", country: "USA", genre: @genre)

    post sessions_url, params: { email_address: @user.email_address, password: "password" }

    @album = Album.create!(
      title: "Master of Puppets",
      release_year: 1986
    )
    @album.bands << @band
    @album.genres << @genre
    @album.styles << @style
  end

  test "should get index" do
    get albums_path
    assert_response :success
  end

  test "should get show" do
    get album_path(@album) 
    assert_response :success
  end

  test "should get new" do
    get new_album_path
    assert_response :success
  end

  test "should get edit" do
    get edit_album_path(@album) 
    assert_response :success
  end
end
