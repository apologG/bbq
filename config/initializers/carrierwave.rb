require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      # aws_access_key_id:     'AKIATO26RYFMPRLDGLOY',
      # aws_secret_access_key: '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'
      aws_access_key_id:     ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY']
    }

    config.fog_directory  = ENV['S3_BUCKET_NAME']
    config.fog_public = false
    config.aws_acl = :private
    # config.fog_directory  = 'massovka-bucket'
  end
end