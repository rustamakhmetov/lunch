class RenameTypeToKindOnCourses < ActiveRecord::Migration[5.1]
  def change
    rename_column(:courses, :type, :kind)
  end
end
