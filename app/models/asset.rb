class Asset
  include ActiveModel::Model

  attr_accessor :file
  attr_accessor :user_id
  attr_reader   :url

  BucketName = 'celaenoimages'
  BasePath   = 'assets/images/'

  def save
    Rails.logger.debug "Asset.save user_id:#{user_id}"
    # 重複を避けるためにタイムスタンプを使う
    filename = Time.zone.now.strftime('%Y%m%d%H%M%S%6N') + File.extname(@file.original_filename)
    obj = s3.bucket(BucketName).object(BasePath + user_id + "/" + filename)
    obj.upload_file(@file.tempfile, {acl: 'public-read'})

    # なぜか http の URL が返ってくるので手動で置換する
    # see: https://github.com/aws/aws-sdk-ruby/issues/1389
    # @url = obj.public_url(virtual_host: true).gsub(/^http:/, 'https:')

    @url = s3.bucket(BucketName).object(BasePath + user_id + "/" + filename).public_url
  end

  private
  def s3
    @s3 ||= Aws::S3::Resource.new(
      :region => 'us-east-1', # 東京以外のリージョンの場合は適宜変更してください
      :access_key_id => 'ENV["AWS_ACCESS_KEY_ID"]',
      :secret_access_key => 'ENV["AWS_SECRET_ACCESS_KEY"]'
    )
  end
end
