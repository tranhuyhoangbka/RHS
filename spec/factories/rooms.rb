FactoryGirl.define do
  factory :room do
    square {rand 10..60}
    parking true
    facility true
    price {rand(1..10)*1000000}
    
    after(:build) do |room|
      Settings.image_sample.each do |url| 
        room.images << FactoryGirl.build(:image, room: room, 
          photo: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, url))))
      end
    end
  end
end
