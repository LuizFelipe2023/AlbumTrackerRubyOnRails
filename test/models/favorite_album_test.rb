require "test_helper"

class FavoriteAlbumTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    @album = Album.create!(
      title: "Test Album",
      release_year: 2024
    )

    @favorite_album = FavoriteAlbum.new(
      user: @user,
      album: @album
    )
  end

  test "should save a valid favorite_album" do
    assert @favorite_album.save, "Failed to save a valid favorite_album"
  end

  test "should not save duplicate favorite_album for same user and album" do
    @favorite_album.save
    duplicate_favorite = FavoriteAlbum.new(user: @user, album: @album)
    assert_not duplicate_favorite.save, "Saved a duplicate favorite_album for the same user and album"
  end

  test "should require a user" do
    @favorite_album.user = nil
    assert_not @favorite_album.save, "Saved a favorite_album without a user"
  end

  test "should require an album" do
    @favorite_album.album = nil
    assert_not @favorite_album.save, "Saved a favorite_album without an album"
  end
end
