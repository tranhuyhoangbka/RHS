namespace :db do
  desc "make sample data by rake task"
  task remake_data: :environment do
    Rake::Task["db:reset"].invoke

    puts "Create admin user"
    FactoryGirl.create :admin

    puts "Create region and everyting relative"
    Settings.locations.each do |location|
      FactoryGirl.create :region, province: location.last
    end

    puts "Create 50 rental of one own user"
    50.times{FactoryGirl.create :address, region: Region.first, user: User.second}
  end
end
