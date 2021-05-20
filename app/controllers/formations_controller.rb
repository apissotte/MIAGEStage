class FormationsController < ApplicationController
  def index
    @formations = Formation.all
    @formation = Formation.create
  end

  def create
    @formation = Formation.new(post_params)
    puts @formation
    if @formation.save
      redirect_to promotions_path
    else
      redirect_to @formation.promotion
    end
  end

  def update
    formation = Formation.find(params[:id])
    formation.update(post_params)

    redirect_to formation.promotion
  end

  def destroy
    formation = Formation.find(params[:id])
    promotion = formation.promotion
    formation.destroy

    redirect_to promotion
  end

  private

  def post_params
    params.require(:formation).permit(:mention, :libelle, :email, :code_ue, :promotion_id)
  end

end
