require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
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
    @band = Band.create!(name: "Metallica", country: "USA", genre: @genre)

    @album = Album.create!(title: "Master of Puppets", release_year: 1986)
    @album.bands << @band
    @album.genres << @genre
    @album.styles << @style

    @review = Review.create!(
      title: "Ótimo álbum",
      content: "Esse álbum é incrível!",
      score: 10,
      user: @user,
      album: @album
    )
  end

  test "should get index" do
    get reviews_path
    assert_response :success
  end

  test "should get show" do
    get review_path(@review)
    assert_response :success
  end

  test "should get new" do
    get new_review_path
    assert_response :success
  end

  test "should get edit" do
    get edit_review_path(@review)
    assert_response :success
  end
end
