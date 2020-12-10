class CreateResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :city
      t.string :state
    end
  end
end
