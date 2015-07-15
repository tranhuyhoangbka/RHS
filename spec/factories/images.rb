FactoryGirl.define do
  factory :image do
    photo Rack::Test::UploadedFile.new(File.open(File.join(
                      Rails.root, "/app/assets/images/house1.jpg")))
  end
end
