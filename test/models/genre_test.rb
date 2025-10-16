require "test_helper"

class GenreTest < ActiveSupport::TestCase
    test "should save a valid genre" do 
          genre = Genre.new(name: "Blues")
          assert genre.save , "Failed to save a valid genre"
    end 

    test "should not save a genre with empty name" do
        genre = Genre.new(
          name: ""
        )
        assert_not genre.save, "Saved a genre without a name"
    end 

    test "should not save genre with duplicate name" do
        Genre.create!(name: "Pop")
        duplicate_genre = Genre.new(name: "Pop")
        assert_not duplicate_genre.save, "Saved genre with duplicate name"
    end
end
