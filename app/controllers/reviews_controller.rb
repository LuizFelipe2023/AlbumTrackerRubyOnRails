class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = Review.includes(:album, :user)
                     .joins(:album)
                     .order('albums.title ASC, reviews.title ASC').page(params[:page]).per(10)
  end

  def show
  end

  def album_reviews
    @album = Album.find(params[:album_id])
    @reviews = @album.reviews.includes(:user).order(created_at: :desc)
  end

  def new
    @review = Review.new
    @review.album_id = params[:album_id] if params[:album_id].present?
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review, notice: "✅ Review created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: "✅ Review updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice: "🗑️ Review deleted successfully."
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :score, :user_id, :album_id)
  end
end
