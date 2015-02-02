class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :cedula
      t.string :nombres
      t.string :apellidos
      t.string :direccion
      t.string :email
      t.string :genero
      t.date :fecha_nac
      t.string :tipo_sangre
      t.string :password
      t.references :ciudad, index: true

      t.timestamps
    end
  end
end
