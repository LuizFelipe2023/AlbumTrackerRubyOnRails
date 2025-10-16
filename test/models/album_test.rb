require "test_helper"

class AlbumTest < ActiveSupport::TestCase
  def setup
    @genre = Genre.create!(name: "Metal")
    @style = Style.create!(name: "Heavy Metal", genre: @genre)
    @band = Band.create!(name: "Metallica", country: "USA", genre: @genre)
  end

  test "should save a valid album" do
    album = Album.new(
      title: "Master of Puppets",
      release_year: 1986
    )
    album.bands << @band
    album.genres << @genre
    album.styles << @style

    assert album.save, "Failed to save a valid album"
  end

  test "should not save album without title" do
    album = Album.new(release_year: 1986)
    assert_not album.save, "Saved an album without title"
  end

  test "should not save album without release_year" do
    album = Album.new(title: "Master of Puppets")
    assert_not album.save, "Saved an album without release_year"
  end
end
