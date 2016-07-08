  CarrierWave.configure do |configure|
    configure.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :aws_seret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
    config.fog_directory = ENV['AWS_S3_BUCKET']
  end
