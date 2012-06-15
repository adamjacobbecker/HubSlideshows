class MiscImageUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::RMagick
  
  process :resize_to_fit => [200, 200]
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
     @name ||= "#{SecureRandom.uuid}.#{file.extension}" if original_filename.present?
  end
  
  storage :file

  def store_dir
    "uploads/project/"
  end

end
