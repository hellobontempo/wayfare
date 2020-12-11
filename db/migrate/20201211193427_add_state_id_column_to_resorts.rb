class AddStateIdColumnToResorts < ActiveRecord::Migration[5.2]
  def change
    add_column :resorts, :state_id, :integer
  end
end
