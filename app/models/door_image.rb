class DoorImage < ApplicationRecord
  LIMIT = 5
  belongs_to :door
  validates :order, presence: true, uniqueness:  { scope: :door_id }
  validate :must_be_within_limit
  
  # amplifyで暗黙的に行っているパラメータ変換の処理
  #  1. CDNを付与するして画像URLをかえす
  # @note Amplify-jsは暗黙的にCDN付きURLにして保存するようなので、backend側で付与することにする。
  # @note S3に削除はしていないので、いずれS3もbackendで巻き取る
  # @todo 共通化　
  def image_url=(val)
    if (val.present? && /^http/.match(val).nil?)
      amplify = Rails.application.config.amplify
      s3 = Aws::S3::Client.new
      s3.copy_object(
        copy_source: ["#{amplify[:closed_s3_bucket]}/public", val].join('/'),
        bucket: amplify[:open_s3_bucket],
        key: "public/#{val}")
      val = "#{amplify[:public_cdn_prefix]}#{val}"
    end
    super(val)
  end
  
  private
  # door_idに紐付くレコードを制限する
  def must_be_within_limit
    errors.add(:base, "door images count limit: #{LIMIT}") if LIMIT < door.door_images.count
  end
end