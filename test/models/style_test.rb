require "test_helper"

class StyleTest < ActiveSupport::TestCase

  def setup
    @genre = Genre.create!(name: "Rock")
  end

  test "should save a valid style" do
    style = Style.new(name: "Heavy Metal", genre: @genre)
    assert style.save, "Failed to save a valid style"
  end

  test "should not save style without a genre" do
    style = Style.new(name: "Heavy Metal")
    assert_not style.save, "Saved style without a genre"
  end

  test "should not save style without a name" do
    style = Style.new(genre: @genre)
    assert_not style.save, "Saved style without a name"
  end
end
