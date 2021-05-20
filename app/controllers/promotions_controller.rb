class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all.order(annee: :asc)
    @promotion = Promotion.new
  end

  def show
    @promotion = Promotion.find(params[:id])
    @formation = Formation.new(promotion_id: @promotion.id)
    puts @formation
  end

  def create
    promotion = Promotion.new(post_params)
    promotion.statut = Promotion.statuts[:OUVERTE]
    promotion.save

    redirect_to promotions_path
  end

  def destroy
    promotion = Promotion.find(params[:id])
    promotion.destroy

    redirect_to promotions_path
  end

  def close
    promotion = Promotion.find(params[:id])
    promotion.cloturer

    redirect_to promotions_path
  end

  private

  def post_params
    params.require(:promotion).permit(:annee)
  end

end
