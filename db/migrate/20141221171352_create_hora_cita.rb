class CreateHoraCita < ActiveRecord::Migration
  def change
    create_table :hora_cita do |t|
      t.time :hora
      t.references :dias
      t.timestamps
    end
  end
end
