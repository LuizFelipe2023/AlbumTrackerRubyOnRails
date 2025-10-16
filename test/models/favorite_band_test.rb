require "test_helper"

class FavoriteBandTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    @genre = Genre.create!(name: "Metal")
    @band = Band.create!(name: "Metallica", genre: @genre, country: "USA")

    @favorite_band = FavoriteBand.new(user: @user, band: @band)
  end

  test "should save a valid favorite_band" do
    assert @favorite_band.save, "Failed to save a valid favorite_band"
  end

  test "should not save duplicate favorite_band for same user and band" do
    @favorite_band.save
    duplicate_favorite = FavoriteBand.new(user: @user, band: @band)
    assert_not duplicate_favorite.save, "Saved a duplicate favorite_band for the same user and band"
  end

  test "should require a user" do
    @favorite_band.user = nil
    assert_not @favorite_band.save, "Saved a favorite_band without a user"
  end

  test "should require a band" do
    @favorite_band.band = nil
    assert_not @favorite_band.save, "Saved a favorite_band without a band"
  end
end
