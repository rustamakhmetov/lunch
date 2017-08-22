class AddCreatedDateToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :created, :date
    add_index :menus, :created, unique: true
  end
end
