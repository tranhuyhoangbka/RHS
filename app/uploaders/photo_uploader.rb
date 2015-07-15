class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file

  version :medium do
    process resize_to_fill: [400, 400]
  end

  version :small_thumb, from_version: :medium do
    process resize_to_fill: [20, 20]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
