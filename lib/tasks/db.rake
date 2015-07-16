namespace :db do
  desc "make sample data by rake task"
  task make_data: :environment do
    Rake::Task["db:reset"].invoke

    puts "Create admin user"
    FactoryGirl.create :admin

    puts "Create 40 addresses and everythings relate"
    40.times {FactoryGirl.create :address}
  end
end
