class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
