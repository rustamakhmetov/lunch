class AddMenuRefToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :menu, foreign_key: true
  end
end
