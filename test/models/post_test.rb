require "test_helper"

class PostTest < ActiveSupport::TestCase
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

    @post = Post.new(
      title: "Meu Primeiro Post",
      content: "Conteúdo detalhado do post com mais de 10 caracteres.",
      user: @user,
      topic: @topic
    )
  end

  test "should save a valid post" do
    assert @post.save, "Failed to save a valid post"
  end

  test "should not save post without title" do
    @post.title = ""
    assert_not @post.save, "Saved a post without a title"
  end

  test "should not save post with short title" do
    @post.title = "Hi"
    assert_not @post.save, "Saved a post with title too short"
  end

  test "should not save post without content" do
    @post.content = ""
    assert_not @post.save, "Saved a post without content"
  end

  test "should not save post with short content" do
    @post.content = "Curto"
    assert_not @post.save, "Saved a post with content too short"
  end
end
