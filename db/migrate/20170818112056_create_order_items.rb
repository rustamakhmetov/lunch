class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |f|
      f.references :order, foreign_key: true
      f.references :menu_item, foreign_key: true
      f.integer :amount, null: false, default: 0
      f.timestamps
    end
  end
end
