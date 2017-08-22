class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.decimal :total, precision: 8, scale: 2, null: false, default: 0
      t.timestamps
    end
  end
end
