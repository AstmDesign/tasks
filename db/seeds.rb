# Delete registered data
User.destroy_all

# Reset all the tables
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

#  Default users
User.create(email: 'admin@tasks.com', password: '123456789', password_confirmation: '123456789', first_name: 'Admin', last_name: 'Tasks', admin: true)
User.create(email: 'user@tasks.com', password: '123456789', password_confirmation: '123456789', first_name: 'User', last_name: 'Tasks', admin: false)
