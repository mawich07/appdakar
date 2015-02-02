class CreateTratamientos < ActiveRecord::Migration
  def change
    create_table :tratamientos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :imagenurl
      t.timestamps
    end
  end
end
