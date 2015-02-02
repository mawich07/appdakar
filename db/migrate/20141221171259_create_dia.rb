class CreateDia < ActiveRecord::Migration
  def change
    create_table :dia do |t|
      t.string :nombre
      t.timestamps
    end
  end
end
