Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"]),
})

S3_BUCKET = Aws::S3::Resource.new.bucket('celaenoimages')
ActionMailer::Base.add_delivery_method :ses,
                                       AWS::SES::Base,
                                       access_key_id: ENV['AWS_ACCESS_KEY_ID2'],
                                       secret_access_key: ENV['AWS_SECRET_ACCESS_KEY2']#,
                                       server: 'email-smtp.us-east-1.amazonaws.com'