AdminUser.find_or_create_by(email: 'hadriansison@gmail.com').update_attributes(
  name: 'Hadrian Aquino Sison',
  role: 'Super Admin',
  status: 'Active',
  password: 'Group5'
)