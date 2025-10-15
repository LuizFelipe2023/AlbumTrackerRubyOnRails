class BandsController < ApplicationController
  before_action :set_band, only: %i[show edit update destroy]

  def index
    @bands = Band.order(:name).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to @band, notice: "Band created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @band.update(band_params)
      redirect_to @band, notice: "Band updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @band.destroy
    redirect_to bands_path, notice: "Band deleted successfully."
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  private

  def band_params
    params.require(:band).permit(
      :name,
      :country,
      :formed_in,
      :genre_id,
      :logo,
      style_ids: [] 
    )
  end

end
