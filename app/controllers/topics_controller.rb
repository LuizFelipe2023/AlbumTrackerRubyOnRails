class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]

  def index
    @sort = params[:sort] || 'recent'
    @search = params[:search]

    @topics = Topic.left_joins(:posts).distinct

    if @search.present?
      @topics = @topics.where('topics.title LIKE ?', "%#{@search}%")
    end

    case @sort
    when 'oldest'
      @topics = @topics.order(created_at: :asc)
    when 'most_posts'
      @topics = @topics
                  .select('topics.*, COUNT(posts.id) AS posts_count')
                  .group('topics.id')
                  .order('posts_count DESC')
    else
      @topics = @topics.order(created_at: :desc)
    end

    @topics = @topics.page(params[:page]).per(10)
  end

  def show; end

  def new
    @topic = Topic.new
  end

  def edit; end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = Current.user  # Associa o tópico ao usuário logado

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: "Tópico criado com sucesso." }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: "Tópico atualizado com sucesso.", status: :see_other }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy!
    respond_to do |format|
      format.html { redirect_to topics_path, notice: "Tópico excluído com sucesso.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description)  # Remove user_id
  end
end
