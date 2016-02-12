class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :phone
      t.text :body
      t.string :source_app

      t.timestamps null: false
    end
  end
end
