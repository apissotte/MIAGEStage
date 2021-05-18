class Stage < ApplicationRecord
  belongs_to :etudiant
  belongs_to :entreprise
  belongs_to :tuteur_entreprise
  belongs_to :tuteur_universitaire
  belongs_to :formation
end
