puts "Create 20 normal users"
20.times {FactoryGirl.create :user}

puts "Create 20 addresses"
20.times {FactoryGirl.create :address}
