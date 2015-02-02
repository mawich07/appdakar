class CreatePreguntasFrecuentes < ActiveRecord::Migration
  def change
    create_table :preguntas_frecuentes do |t|
      t.string :pregunta
      t.string :respuesta

      t.timestamps
    end
  end
end
