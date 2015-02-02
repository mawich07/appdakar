class CreateAdministradors < ActiveRecord::Migration
  def change
    create_table :administradors do |t|
      t.string :usuario
      t.string :password
      t.string :nombres
      t.string :apellidos
      t.string :avatar
      t.boolean :es_super_usuario
      t.timestamps
    end
  end
end
