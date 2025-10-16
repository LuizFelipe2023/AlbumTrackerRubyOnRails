require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do

    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    @topic = Topic.create!(
      title: "Test Topic",
      description: "This is a test topic",
      user: @user
    )

    @post = Post.create!(
      title: "Test Post",
      content: "This is a test post",
      user: @user,
      topic: @topic
    )

    @comment = Comment.create!(
      content: "This is a test comment",
      post: @post,
      user: @user
    )

    post sessions_url, params: { email_address: @user.email_address, password: "password" }
  end

  test "should create comment" do
    assert_difference("Comment.count", 1) do
      post post_comments_path(@post), params: { comment: { content: "Another comment", user_id: @user.id } }
    end

    assert_redirected_to post_path(@post)
  end

  test "should update comment" do
    patch post_comment_path(@post, @comment), params: { comment: { content: "Updated content" } }
    assert_redirected_to post_path(@post)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete post_comment_path(@post, @comment)
    end

    assert_redirected_to post_path(@post)
  end
end
