class Promotion < ApplicationRecord
  has_many :formations

  enum statut: { :OUVERTE => 'OUVERTE', :CLOTUREE => 'CLOTUREE' }

  validates :annee, presence: true

  def cloturer
    self.update(statut: :CLOTUREE)
  end

end
