class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.string :email
      t.string :nombre
      t.string :motivo
      t.text :mensaje
      t.boolean :estado, :default => false
      t.timestamps
    end
  end
end
