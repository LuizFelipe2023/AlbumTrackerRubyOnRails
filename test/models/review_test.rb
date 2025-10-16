require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: "Test User", username: "testuser", email_address: "test@example.com", password: "password", password_confirmation: "password")
    @album = Album.create!(title: "Test Album", release_year: 2025)
    @review = Review.new(
      title: "Great Album",
      content: "This album is amazing and I love every track.",
      score: 9.5,
      user: @user,
      album: @album
    )
  end

  test "should save a valid review" do
    assert @review.save, "Failed to save a valid review"
  end

  test "should not save review without title" do
    @review.title = ""
    assert_not @review.save, "Saved a review without a title"
  end

  test "should not save review with short title" do
    @review.title = "Hi"
    assert_not @review.save, "Saved a review with title too short"
  end

  test "should not save review without content" do
    @review.content = ""
    assert_not @review.save, "Saved a review without content"
  end

  test "should not save review with short content" do
    @review.content = "Too short"
    assert_not @review.save, "Saved a review with content too short"
  end

  test "should not save review without score" do
    @review.score = nil
    assert_not @review.save, "Saved a review without score"
  end

  test "should not save review with score out of range" do
    @review.score = 11
    assert_not @review.save, "Saved a review with score higher than 10"

    @review.score = -1
    assert_not @review.save, "Saved a review with score lower than 0"
  end

  test "should not allow same user to review same album twice" do
    @review.save
    duplicate_review = Review.new(
      title: "Another review",
      content: "Another content.",
      score: 8,
      user: @user,
      album: @album
    )
    assert_not duplicate_review.save, "Saved a duplicate review for the same album by the same user"
  end
end
