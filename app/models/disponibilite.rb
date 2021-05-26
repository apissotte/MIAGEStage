class Disponibilite < ApplicationRecord
  belongs_to :tuteur_universitaire
  belongs_to :promotion

  enum statut_reponse: { :OK => "OK", :ABANDON => "ABANDON", :PAS_DE_REPONSE => "PAS_DE_REPONSE" }

  validates :nb_etudiants_souhaite, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :tuteur_universitaire, uniqueness: { scope: :promotion }

end
