desc "Create admin user"
task create_admin_users: :environment do
  puts "Create admin user"
  FactoryGirl.create :admin
end
