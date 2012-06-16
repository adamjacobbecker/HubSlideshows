if Rails.env.production?
  
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['AWS_SECRET_KEY']
    }
    config.fog_directory  = 'HubSlideshows'
  end
  
else
  
  CarrierWave.configure do |config|
    config.storage = :file
  end
  
end
