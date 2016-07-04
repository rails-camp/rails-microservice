class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :app_name
      t.string :api_key

      t.timestamps null: false
    end
  end
end
