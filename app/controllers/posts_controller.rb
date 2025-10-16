class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post
      .left_joins(:comments, :topic)
      .select('posts.*, COUNT(comments.id) AS comments_count')
      .group('posts.id')
      
    if params[:topic_id].present?
      @posts = @posts.where(topic_id: params[:topic_id])
    end
    
    if params[:search].present?
      @posts = @posts.where('posts.title LIKE ?', "%#{params[:search]}%")
    end
    
    @posts = @posts
      .order('comments_count DESC, posts.created_at DESC')
      .page(params[:page])
      .per(10)
    
    @topics = Topic.all.order(:title)
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Current.user.posts.build(post_params) 

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy!
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:topic_id, :title, :content) 
    end
end
