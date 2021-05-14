# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create([
	{ model: 'iPhone 11 128G Blk' },
	{ model: 'iPhone 11 128G Blk' },
	{ model: 'iPhone 11 128G Blk' },
	{ model: 'iPad 7th gen 32G Space' },
	{ model: 'iPad 7th gen 128G Space' },
	{ model: 'iPad 7th gen 32G Silver' },
	{ model: 'iPad 7th gen 128G Silver' },
	{ model: 'iPad 7th gen 32G Black' },
	{ model: 'iPad 7th gen 128G Black' },
])

SalesStage.create([
	{ stage: 'None' },
	{ stage: 'Prospect/Qualify' },
	{ stage: 'Propose' },
	{ stage: 'Negotiate' },
	{ stage: 'Lost' },
	{ stage: 'Shipped' }
])

#VZW SEs
SysEngineerUser.new(email: "Donl@example.com",  password: "password123", password_confirmation: "password123", role: "se", carrier: "verizon", firstname: "Pete", lastname: "Lopez" ).save(:validate => false)
SysEngineerUser.new(email: "dong@example.com",  password: "password123", password_confirmation: "password123", role: "se", carrier: "verizon", firstname: "Don", lastname: "Johnson" ).save(:validate => false)
SysEngineerUser.new(email: "michaelf@example.com",  password: "password123", password_confirmation: "password123", role: "se", carrier: "verizon", firstname: "Michael", lastname: "Finklestein" ).save(:validate => false)

#att SEs
SysEngineerUser.new(email: "brettb@example.com",  password: "password123", password_confirmation: "password123", role: "se", carrier: "att", firstname: "Brett", lastname: "Bell" ).save(:validate => false)
SysEngineerUser.new(email: "johng@example.com",  password: "password123", password_confirmation: "password123", role: "se", carrier: "att", firstname: "John", lastname: "Rabinowitz" ).save(:validate => false)
SysEngineerUser.new(email: "nealf@example.com",  password: "password123", password_confirmation: "password123", role: "se", carrier: "att", firstname: "Neal", lastname: "O'Neil" ).save(:validate => false)

#t-mobile SEs
SysEngineerUser.new(email: "tobyb@example.com",  password: "password123", password_confirmation: "password123", role: "se", carrier: "t-mobile", firstname: "Toby", lastname: "Miller" ).save(:validate => false)
SysEngineerUser.new(email: "chriswr@example.com",  password: "password123", password_confirmation: "password123", role: "se", carrier: "t-mobile", firstname: "Chris", lastname: "Wrong" ).save(:validate => false)

#verizon AEs
AccountExecUser.new(email: "stevej@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "verizon", firstname: "Steve", lastname: "Jaguar" ).save(:validate => false)
AccountExecUser.new(email: "grantm@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "verizon", firstname: "Grant", lastname: "Masters" ).save(:validate => false)
AccountExecUser.new(email: "chrisw@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "verizon", firstname: "Chris", lastname: "Arnold" ).save(:validate => false)
AccountExecUser.new(email: "marcw@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "verizon", firstname: "Marc", lastname: "Wheeler" ).save(:validate => false)

#att AEs
AccountExecUser.new(email: "reneeb@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "att", firstname: "Renee", lastname: "Smith" ).save(:validate => false)
AccountExecUser.new(email: "peterc@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "att", firstname: "Peter", lastname: "Lesser" ).save(:validate => false)
AccountExecUser.new(email: "kevint@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "att", firstname: "Kevin", lastname: "Marshall" ).save(:validate => false)
AccountExecUser.new(email: "bethw@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "att", firstname: "Beth", lastname: "Wilson" ).save(:validate => false)

#t-mobile AEs
AccountExecUser.new(email: "rickp@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "t-mobile", firstname: "Rick", lastname: "Paul" ).save(:validate => false)
AccountExecUser.new(email: "paigeo@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "t-mobile", firstname: "Paige", lastname: "O'Keefe" ).save(:validate => false)
AccountExecUser.new(email: "davidh@example.com",  password: "password123", password_confirmation: "password123", role: "ae", carrier: "t-mobile", firstname: "David", lastname: "Harley" ).save(:validate => false)

# Sales Leads
SalesLeadUser.new(email: "robm@example.com",  password: "password123", password_confirmation: "password123", role: "saleslead", carrier: "att", firstname: "Rob", lastname: "Manson" ).save(:validate => false)
SalesLeadUser.new(email: "chrisb@example.com",  password: "password123", password_confirmation: "password123", role: "saleslead", carrier: "verizon", firstname: "Chris", lastname: "Belaire" ).save(:validate => false)
SalesLeadUser.new(email: "graceo@example.com",  password: "password123", password_confirmation: "password123", role: "saleslead", carrier: "t-mobile", firstname: "Grace", lastname: "Olson" ).save(:validate => false)

# Managers
ManagerUser.new(email: "justinv@example.com",  password: "password123", password_confirmation: "password123", role: "manager", carrier: "all", firstname: "Justin", lastname: "Van Ess" ).save(:validate => false)
ManagerUser.new(email: "stevec@example.com",  password: "password123", password_confirmation: "password123", role: "admin", carrier: "all", firstname: "Steve", lastname: "Conner" ).save(:validate => false)

# Admins
AdminUser.new(email: "admin@example.com",  password: "password123", password_confirmation: "password123", role: "admin", carrier: "all", firstname: "Admin", lastname: "User" ).save(:validate => false)




20.times do |opportunity|
	Opportunity.create!(
      customer_name: "Giant Corporation #{opportunity}",
      quantity: 1500,
      use_case: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      stage: 3,
      product_id: 1,
      user_id: 1,
      account_exec_user_id: 10,
      sys_engineer_user_id: 1,
      carrier: "verizon"
		)
end


20.times do |opportunity|
	Opportunity.create!(
      customer_name: "Better Corporation #{opportunity}",
      quantity: 1500,
      use_case: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      stage: 3,
      product_id: 1,
      user_id: 1,
      account_exec_user_id: 12,
      sys_engineer_user_id: 4,
      carrier: "att"
		)
end

20.times do |opportunity|
	Opportunity.create!(
      customer_name: "Industrial Corporation #{opportunity}",
      quantity: 1500,
      use_case: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      stage: 3,
      product_id: 1,
      user_id: 1,
      account_exec_user_id: 18,
      sys_engineer_user_id: 7,
      carrier: "t-mobile"
		)
end

