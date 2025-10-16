require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
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

      @post = Post.create(
        topic: @topic,
        user: @user,
        title: "Testing a title okay",
        content: "blalblalblalslalalalalallalalalala"
      )
  end

  test "should get index" do
    get posts_path
    assert_response :success
  end

  test "should get new" do
    get new_post_path
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_path, params: { post: { content: @post.content, title: @post.title, topic_id: @post.topic_id, user_id: @post.user_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_path(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_path(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_path(@post), params: { post: { content: @post.content, title: @post.title, topic_id: @post.topic_id, user_id: @post.user_id } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_path(@post)
    end

    assert_redirected_to posts_path
  end
end
