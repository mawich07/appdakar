class CreateImagens < ActiveRecord::Migration
  def change
    create_table :imagens do |t|
      t.string :imagen
      t.timestamps
    end
  end
end
