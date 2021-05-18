class CreateFicheStages < ActiveRecord::Migration[6.1]
  def change
    create_table :fiche_stages do |t|
      t.string :titre
      t.string :poste
      t.string :taches
      t.string :statut
      t.string :type
      t.string :mention
      t.date :date_debut
      t.date :date_fin
      t.binary :fiche_papier
      t.string :contact_nom
      t.string :contact_prenom
      t.string :contact_poste

      t.belongs_to :etudiant, foreign_key: true
      t.belongs_to :offre, foreign_key: true
    end
    add_check_constraint :fiche_stages, 'statut IN ("VALIDEE","NON_VALIDEE", "NON_TRAITEE")'
    add_check_constraint :fiche_stages, 'type IN ("ALTERNANCE","STAGE")'
    add_check_constraint :fiche_stages, 'mention IN ("L3","M1", "M2")'
  end
end
