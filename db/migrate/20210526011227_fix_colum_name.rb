class FixColumName < ActiveRecord::Migration[6.1]
  def change
    rename_column :stages, :type, :type_stage
  end
end
