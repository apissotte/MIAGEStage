class Etudiant < ApplicationRecord
  has_and_belongs_to_many :formations

  enum statut_arrivant_L3: { MIAGE: 'MIAGE', DSPEG: 'DSPEG' }

  def name_with_initial
    "#{nom.upcase} #{prenom}"
  end

  def transfert(formation)
    self.formations << formation
    self.save
  end
end
