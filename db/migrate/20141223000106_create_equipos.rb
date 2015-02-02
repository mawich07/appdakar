class CreateEquipos < ActiveRecord::Migration
  def change
    create_table :equipos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :imagenurl
      t.timestamps
    end
  end
end
