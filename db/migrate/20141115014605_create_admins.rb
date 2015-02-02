class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :usuario
      t.string :password
      t.string :nombres
      t.string :apellidos
      t.string :attachment
      t.timestamps
    end
  end
end
