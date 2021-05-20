class Formation < ApplicationRecord
  belongs_to :promotion
  has_and_belongs_to_many :etudiants
  has_many :disponibilites

  enum mention: { L3: 'L3', M1: 'M1', M2: 'M2' }
end
