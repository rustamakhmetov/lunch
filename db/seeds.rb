# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# clear database
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if ['schema_migrations', 'ar_internal_metadata', 'users'].include? table

  # MySQL and PostgreSQL
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE")

  # SQLite
  # ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

courses = []
10.times do |i|
  courses << Course.create(name: "Name #{i}", kind: i % 3)
end
iter_courses = courses.cycle

Dashboard.dates_week(Date.today).each do |day|
  menu = Menu.create(created_at: day)
  rand(6...9).times do
    menu.items.create(course: iter_courses.next, price: rand(1.0...10.0).round(2))
  end
end