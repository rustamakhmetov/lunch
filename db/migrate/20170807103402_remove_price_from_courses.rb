class RemovePriceFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :price
  end
end
