class CreatePatologia < ActiveRecord::Migration
  def change
    create_table :patologia do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
