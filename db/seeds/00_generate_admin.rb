AdminUser.find_or_create_by(email: 'admin@gmail.com').update_attributes(
  name: 'admin',
  role: 'Super Admin',
  status: 'Active',
  password: 'Password@123'
)