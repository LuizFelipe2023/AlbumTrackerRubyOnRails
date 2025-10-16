require "test_helper"

class TopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    post sessions_path, params: { email_address: @user.email_address, password: "password" }

    @topic = Topic.create!(
      title: "Initial Title",
      description: "This is a proper description for testing.",
      user: @user
    )
  end

  test "should get index" do
    get topics_path
    assert_response :success
  end

  test "should get new" do
    get new_topic_path
    assert_response :success
  end

  test "should create topic" do
    assert_difference("Topic.count", 1) do
      post topics_path, params: { topic: { title: "New Topic", description: "A proper description" } }
    end
    assert_redirected_to topic_path(Topic.last)
  end

  test "should show topic" do
    get topic_path(@topic)
    assert_response :success
  end

  test "should get edit" do
    get edit_topic_path(@topic)
    assert_response :success
  end

  test "should update topic" do
    patch topic_path(@topic), params: { topic: { title: "Updated Title", description: "Updated description" } }
    assert_redirected_to topic_path(@topic)
    @topic.reload
    assert_equal "Updated Title", @topic.title
  end

  test "should destroy topic" do
    assert_difference("Topic.count", -1) do
      delete topic_path(@topic)
    end
    assert_redirected_to topics_path
  end
end
