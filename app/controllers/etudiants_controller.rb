class EtudiantsController < ApplicationController
  def index
    @etudiants = Etudiant.order(:nom, :prenom, :num_etudiant)
  end

  def new
    @etudiant = Etudiant.new
  end

  def create
    @etudiant = Etudiant.new(post_params)

    # Génération des informations pour l'authentification
    @etudiant.email = @etudiant.email_personnel
    @etudiant.password = @etudiant.nom + @etudiant.num_etudiant

    if @etudiant.save
      redirect_to etudiants_path
    end
  end

  def edit
    @etudiant = Etudiant.find(params[:id])
  end

  def update
    @etudiant = Etudiant.find(params[:id])

    if @etudiant.update(post_params)
      redirect_to etudiants_path
    end
  end

  def destroy
    etudiant = Etudiant.find(params[:id])
    etudiant.destroy

    redirect_to etudiants_path
  end

  private
  def post_params
    params.require(:etudiant).permit(:formation_ids, :num_etudiant, :nom, :prenom, :email_universitaire, :email_personnel, :statut_arrivant_L3)
  end
end
