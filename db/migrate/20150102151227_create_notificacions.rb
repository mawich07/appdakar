class CreateNotificacions < ActiveRecord::Migration
  def change
    create_table :notificacions do |t|
      t.date :fecha
      t.timestamps
    end
  end
end
