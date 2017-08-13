class RemoveMenuItemFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :menu_item_id
  end
end
