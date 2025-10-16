require "test_helper"

class TopicTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: "Test User", username: "testuser", email_address: "test@example.com", password: "password", password_confirmation: "password")
    @topic = Topic.new(
      title: "My First Topic",
      description: "This is a detailed description for the topic.",
      user: @user
    )
  end

  test "should save a valid topic" do
    assert @topic.save, "Failed to save a valid topic"
  end

  test "should not save topic without title" do
    @topic.title = ""
    assert_not @topic.save, "Saved a topic without title"
  end

  test "should not save topic with title less than 3 characters" do
    @topic.title = "Hi"
    assert_not @topic.save, "Saved a topic with title too short"
  end

  test "should not save topic without description" do
    @topic.description = ""
    assert_not @topic.save, "Saved a topic without description"
  end

  test "should not save topic with description less than 10 characters" do
    @topic.description = "Too short"
    assert_not @topic.save, "Saved a topic with description too short"
  end

  test "should not save topic with duplicate title for same user" do
    @topic.save
    duplicate_topic = Topic.new(title: @topic.title, description: "Another description", user: @user)
    assert_not duplicate_topic.save, "Saved a topic with duplicate title for the same user"
  end

  test "should allow same title for different users" do
    @topic.save
    another_user = User.create!(name: "Other User", username: "otheruser", email_address: "other@example.com", password: "password", password_confirmation: "password")
    topic_for_other_user = Topic.new(title: @topic.title, description: "Different description", user: another_user)
    assert topic_for_other_user.save, "Failed to save topic with same title for a different user"
  end
end
