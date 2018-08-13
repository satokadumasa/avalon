class Asset
  include ActiveModel::Model

  attr_accessor :file
  attr_accessor :user_id
  attr_reader   :url
# bucket: celaenoimages
# access_key_id: AKIAJ6HOMTSNNX4EXW5Q
# secret_access_key: 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
# s3_host_name: https://s3.amazonaws.com/celaenoimages/images
  BucketName = 'celaenoimages'
  BasePath   = 'assets/images/'

  def save
    resource = Aws::S3::Resource.new(
      :region => 'us-east-1', # 東京以外のリージョンの場合は適宜変更してください
      :access_key_id => 'ENV["AWS_ACCESS_KEY_ID"]',
      :secret_access_key => 'ENV["AWS_SECRET_ACCESS_KEY"]'
    )
    # arr = @user_profile.profile_photo.to_s.split("celaenoimages/")
    # object = resource.bucket('celaenoimages').object(arr[1])
    # url = URI.parse(object.presigned_url(:get, expires_in: 60)) # 有効期限を1分から変更する場合は適宜変更してください。
    # @profile_photo = url

    # 重複を避けるためにタイムスタンプを使う
    filename = Time.zone.now.strftime('%Y%m%d%H%M%S%6N') + File.extname(@file.original_filename)
    obj = resource.bucket(BucketName).object(BasePath + filename)
    obj.upload_file(@file.tempfile, {acl: 'public-read'})

    # なぜか http の URL が返ってくるので手動で置換する
    # see: https://github.com/aws/aws-sdk-ruby/issues/1389
    # @url = obj.public_url(virtual_host: true).gsub(/^http:/, 'https:')

    @url = resource.bucket(BucketName).object(BasePath + filename).public_url
  end

  private
  def s3
    @s3 ||= Aws::S3::Resource.new
  end
end
