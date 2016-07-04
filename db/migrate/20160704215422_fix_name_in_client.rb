class FixNameInClient < ActiveRecord::Migration
  def change
  	remove_column :clients, :app_name, :string
  	add_column :clients, :source_app, :string
  end
end
