class CreateAlerta < ActiveRecord::Migration
  def change
    create_table :alerta do |t|
      t.integer :tipo # 1 => notificacion, 2 => mensaje, 3 => cita
      t.string :emisor
      t.string :mensaje
      t.boolean :estado # 1 => visto, 0 => no visto
      t.timestamps
    end
  end
end
