class CreateCita < ActiveRecord::Migration
  def change
    create_table :cita do |t|
      t.date :fecha
      t.string :hora
      t.string :nombre
      t.string :telefono_movil
      t.references :paciente
      t.timestamps
    end
  end
end