class CommentsController < ApplicationController
  before_action :set_post           
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = Current.user

    if @comment.save
      redirect_to @post, notice: "Comment was successfully created."
    else
      redirect_to @post, alert: @comment.errors.full_messages.join(", ")
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: "Comment was successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
