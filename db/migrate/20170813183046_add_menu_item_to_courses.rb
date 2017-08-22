class AddMenuItemToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :menu_item, foreign_key: true
    remove_reference :courses, :menu, foreign_key: true
  end
end
