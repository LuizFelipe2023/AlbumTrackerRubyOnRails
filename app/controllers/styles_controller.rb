class StylesController < ApplicationController
  before_action :set_style, only: %i[show edit update destroy]

  def index
    @styles = Style.includes(:genre).order(:name)
  end

  def show
  end

  def new
    @style = Style.new
  end

  def edit
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      redirect_to styles_path, notice: "Style created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @style.update(style_params)
      redirect_to styles_path, notice: "Style updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @style.destroy
    redirect_to styles_path, notice: "Style deleted successfully"
  end

  private

  def set_style
    @style = Style.find(params[:id])
  end

  def style_params
    params.require(:style).permit(:name, :genre_id)
  end
end
