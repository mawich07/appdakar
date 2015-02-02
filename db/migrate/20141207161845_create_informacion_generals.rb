class CreateInformacionGenerals < ActiveRecord::Migration
  def change
    create_table :informacion_generals do |t|
      t.string :nombre_empresa
      t.string :direccion
      t.string :numero_movil
      t.string :numero_fijo
      t.string :email
      t.text :como_llegar
      t.text :quienes_somos
      t.text :trayectoria
      t.text :valores
      t.text :mision
      t.text :vision
      t.text :politicas_calidad
      t.timestamps
    end
  end
end
