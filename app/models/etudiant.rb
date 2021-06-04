class Etudiant < ApplicationRecord
  # attr_accessor :num_etudiant, :nom, :prenom, :email_universitaire, :email_personnel, :statut_arrivant_L3

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
