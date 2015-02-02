class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.string :dias
      t.string :rango_horas
      t.timestamps
    end
  end
end
