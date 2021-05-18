class Disponibilite < ApplicationRecord
  belongs_to :tuteur_universitaire
  belongs_to :formation
end
