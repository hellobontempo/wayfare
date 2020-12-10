class RenameDestinationColumnToTrip < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :destination, :name
  end
end
