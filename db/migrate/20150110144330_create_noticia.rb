class CreateNoticia < ActiveRecord::Migration
  def change
    create_table :noticia do |t|
      t.string :imagen
      t.text :detalle
      t.string :titulo
      t.text :noticia
      t.references :administrador, index: true
      t.timestamps
    end
  end
end