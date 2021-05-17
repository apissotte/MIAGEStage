class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions, primary_key: [:annee] do |t|
      t.string :annee, limit: 4
    end
  end
end
