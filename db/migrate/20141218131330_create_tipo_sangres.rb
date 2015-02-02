class CreateTipoSangres < ActiveRecord::Migration
  def change
    create_table :tipo_sangres do |t|
      t.string :tipo
      t.timestamps
    end
  end
end
