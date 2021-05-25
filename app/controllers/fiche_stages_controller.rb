class FicheStagesController < ApplicationController
  def index
    @fichestage = FicheStage.all
  end

  def show
    @fichestage = FicheStage.find(params[:id])
  end

  def new
    @fichestage = FicheStage.new
  end

  def create
    @fichestage = FicheStage.new(fiche_stage_params)
    @fichestage.update(statut: "BROUILLON")

    if @fichestage.save
      #redirect_to @fichestage
    else
      render :new
    end
  end

  def edit
    @fichestage = FicheStage.find(params[:id])
  end

  def update
    @fichestage = FicheStage.find(params[:id])

    if @fichestage.update(fiche_stage_params)
      redirect_to @fichestage
    else
      render :edit
    end
  end

  private
  def fiche_stage_params
    params.require(:fiche_stage).permit(
      :titre, :type_stage, :mention, :date_debut, :date_fin,
      :poste, :taches, :technologies, :contact_nom, :contact_prenom, :contact_poste,
      :tuteur_nom, :tuteur_prenom, :tuteur_fonction, :tuteur_telephone, :tuteur_email,
      :entreprise_nom, :entreprise_siren, :entreprise_cp, :entreprise_ville, :entreprise_pays)
  end

  def destroy
    #@fichestage = fiche_stages.all
  end
end
