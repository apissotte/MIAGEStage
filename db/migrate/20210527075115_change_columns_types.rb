class ChangeColumnsTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :ge_formats, :contenu, :text
    change_column :notation_formats, :contenu, :text
  end
end
