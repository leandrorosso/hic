class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :slug
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
