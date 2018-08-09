class DosesController < ApplicationController
  before_action :set_cocktail

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail
    else
      render :new
    end
  end

  def destroy
    Dose.destroy(params[:id])
    cocktail = Cocktail.find(Dose.find(params[:id]).cocktail_id)
    redirect_to cocktail
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
