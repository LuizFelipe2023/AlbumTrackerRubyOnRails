require "test_helper"

class BandTest < ActiveSupport::TestCase
  def setup
    @genre = Genre.create!(name: "Metal")
    @style1 = Style.create!(name: "Heavy Metal", genre: @genre)
    @style2 = Style.create!(name: "Thrash Metal", genre: @genre)
  end

  test "should save a valid band with multiple styles" do
    band = Band.new(name: "Metallica", country: "USA", genre: @genre)
    assert band.save, "Failed to save a valid band"

    band.styles << [@style1, @style2]
    assert_equal 2, band.styles.count, "Band does not have the correct number of styles"
  end

  test "should not save a band without a genre" do
    band = Band.new(name: "Unknown Band", country: "Unknown")
    assert_not band.save, "Saved a band without a genre"
  end

  test "should not save a band without country" do
    band = Band.new(name: "NoCountryBand", genre: @genre)
    assert_not band.save, "Saved a band without country"
  end
end
