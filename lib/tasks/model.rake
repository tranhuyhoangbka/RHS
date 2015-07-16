namespace :model do
  desc "model"
  task create_all: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Create admin user"
    FactoryGirl.create :admin

    puts "Create 40 comments and everythings relate"
    40.times {FactoryGirl.create :comment}
  end
end
