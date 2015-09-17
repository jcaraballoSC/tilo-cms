class ImageUploader < CarrierWave::Uploader::Base
 
  storage :fog
 
  def store_dir
    #{}"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "uploads/#{model.id}"
  end
 
 
end