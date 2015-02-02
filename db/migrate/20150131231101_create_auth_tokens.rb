class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens do |t|
      t.string :token
      t.boolean :activo
      t.references :paciente
      t.timestamps
    end
  end
end
