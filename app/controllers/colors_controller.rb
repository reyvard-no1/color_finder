class ColorsController < ApplicationController
  before_action :set_color, only: [:update]

  def update
    if @color.update(color_params)
      redirect_to palette_path(@color.palette), notice: "La couleur a été modifiée !"
    else
      redirect_to palette_path(@color.palette), alert: "La modification a échoué"
    end
  end

  private

  def set_color
    @color = Color.joins(:palette).where(palettes: { user_id: current_user.id }).find(params[:id])
  end

  def color_params
    params.require(:color).permit(:name, :description)
  end
end
