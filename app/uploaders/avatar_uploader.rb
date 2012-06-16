class AvatarUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::RMagick
  
  process :resize_to_fill => [200, 200]
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
     @name ||= "#{SecureRandom.uuid}.#{file.extension}" if original_filename.present?
  end
  
  def store_dir
    "uploads/project/"
  end

end
