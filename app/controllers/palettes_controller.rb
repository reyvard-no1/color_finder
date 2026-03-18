class PalettesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_palette, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @palette.update(palette_params)
      redirect_to @palette, notice: "La palette a été modifiée!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    palette_name = @palette.name
    @palette.destroy
    redirect_to collections_path, notice: "#{palette_name} supprimée"
  end

  private

  def set_palette
    @palette = current_user.palettes.find(params[:id])
  end

  def palette_params
    params.require(:palette).permit(:name)
  end
end
