# Delete registered data
User.destroy_all
Project.destroy_all
Task.destroy_all
Comment.destroy_all

# Reset all the tables
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

#  Default users
@admin = User.create(email: 'admin@tasks.com', password: '123456789', password_confirmation: '123456789', first_name: 'Admin', last_name: 'Tasks', admin: true)
@user = User.create(email: 'user@tasks.com', password: '123456789', password_confirmation: '123456789', first_name: 'User', last_name: 'Tasks', admin: false)

# Default data for testing
10.times do
  Project.create(name: Faker::Commerce.department, details: Faker::Lorem.paragraph(2), status: 1, user_id: @user.id)
end

20.times do
  Task.create(title: Faker::Commerce.department, details: Faker::Lorem.paragraph(2), deadline: '2019-06-12 10:00:00', priority: 1, status: 1, project_id: Faker::Number.between(1, 10), user_id: @user.id)
end

20.times do
  Comment.create(task_id: Faker::Number.between(1, 10), comment: Faker::Lorem.paragraph(2), user_id: @user.id)
end
