class ChangeDatatypeStateIdResorts < ActiveRecord::Migration[5.2]
  def change
    change_column :resorts, :state_id, :integer
  end
end
