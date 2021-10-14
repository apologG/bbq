# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
 
  include CarrierWave::RMagick
  def filename
    "avatar.jpg" if original_filename
  end
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  version :thumb do
    process resize_to_fit: [100, 100]
  end
  version :mini do
    process resize_to_fit: [25, 25]
  end
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  process resize_to_fill: [300, 300]
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "avatar.jpg" if original_filename
  end
end

