require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(
      name: "Test User",
      username: "testuser",
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    @topic = Topic.create!(
      title: "Meu Tópico",
      description: "Descrição do tópico com mais de 10 caracteres.",
      user: @user
    )

    @post = Post.create!(
      title: "Meu Primeiro Post",
      content: "Conteúdo detalhado do post com mais de 10 caracteres.",
      user: @user,
      topic: @topic
    )

    @comment = Comment.new(
      content: "Esse é um comentário válido.",
      user: @user,
      post: @post
    )
  end

  test "should save a valid comment" do
    assert @comment.save, "Failed to save a valid comment"
  end

  test "should not save comment without content" do
    @comment.content = ""
    assert_not @comment.save, "Saved a comment without content"
  end

  test "should not save comment with short content" do
    @comment.content = "a"
    assert_not @comment.save, "Saved a comment with content too short"
  end

  test "should not save comment with content too long" do
    @comment.content = "a" * 2001
    assert_not @comment.save, "Saved a comment with content too long"
  end
end
