class Formation < ApplicationRecord
  belongs_to :promotion
  has_and_belongs_to_many :etudiants
  has_many :disponibilites
  has_many :offres
end
