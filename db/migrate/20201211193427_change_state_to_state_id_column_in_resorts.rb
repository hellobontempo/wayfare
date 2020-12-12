class ChangeStateToStateIdColumnInResorts < ActiveRecord::Migration[5.2]
  def change
    rename_column :resorts, :state, :state_id
  end
end
