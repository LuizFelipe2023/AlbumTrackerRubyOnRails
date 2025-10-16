require "test_helper"

class BandsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(name: "test user", username: "test", email_address: "test@example.com", password: "password", password_confirmation: "password")

    post sessions_url, params: { email_address: @user.email_address, password: "password" }

    @genre = Genre.create!(name: "Metal")
    @style1 = Style.create!(name: "Heavy Metal", genre: @genre)
    @style2 = Style.create!(name: "Thrash Metal", genre: @genre)

    @band = Band.create!(
      name: "Metallica",
      country: "USA",
      genre: @genre
    )
    @band.styles << [@style1, @style2]
  end

  test "should get index" do
    get bands_path
    assert_response :success
  end

  test "should get new" do
    get new_band_path
    assert_response :success
  end

  test "should get show" do
    get band_path(@band)  
    assert_response :success
  end

  test "should get edit" do
    get edit_band_path(@band) 
    assert_response :success
  end
end
