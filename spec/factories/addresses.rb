FactoryGirl.define do
  factory :address do
    contact {Faker::Lorem.sentence 2}
    address {Faker::Address.street_address}
    description {Faker::Lorem.sentence 5}
    lat {rand 20.0..22.0}
    lng {rand 105.0..106.0}
    capacity {rand 1..10}
    rating {rand 1..5}
    title {Faker::Lorem.sentence}
    user    

    after(:build) do |address|      
      address.rooms << FactoryGirl.build(:room, address: address)
      Settings.image_sample.each do |url|
        address.images << FactoryGirl.build(:image, address: address, 
          photo: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, url))))
      end
    end
  end
end
