class CreateTelefonos < ActiveRecord::Migration
  def change
    create_table :telefonos do |t|
      t.string :numero
      t.references :paciente, index: true
      t.timestamps
    end
  end
end
