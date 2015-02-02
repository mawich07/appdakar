class CreateHistorials < ActiveRecord::Migration
  def change
    create_table :historials do |t|
      t.date :fecha
      t.string :detalle
      t.string :tratamiento
      t.references :paciente, index: true
      t.references :patologia, index: true
      t.timestamps
    end
  end
end
