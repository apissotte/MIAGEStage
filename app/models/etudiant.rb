class Etudiant < ApplicationRecord
  has_and_belongs_to_many :formations
end
