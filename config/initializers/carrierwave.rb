if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider     = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      region:                'eu-north-1'
    }

    config.fog_public     = false
    config.fog_directory  = ENV['S3_BUCKET']
    config.cache_storage  = :file
  end
end