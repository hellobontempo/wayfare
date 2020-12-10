class CreateTripResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_resorts do |t|
      t.integer :trip_id
      t.integer :resort_id
    end
  end
end
