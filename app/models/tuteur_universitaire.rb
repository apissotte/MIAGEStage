class TuteurUniversitaire < ApplicationRecord
  has_many :disponibilites

  enum statut_encadrant: { :INDUSTRIE => 'INDUSTRIE', :UNIVERSITAIRE => 'UNIVERSITAIRE' }
  
  validates :nom, :prenom, :alias, :email, :fonction, :localisation, presence: true

end
