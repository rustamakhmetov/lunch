class AddFieldsToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :price, :decimal, :precision => 8, :scale => 2
    add_column :courses, :type, :integer
  end
end
