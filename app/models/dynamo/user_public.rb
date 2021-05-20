class Dynamo::UserPublic < Dynamo::Base
  include AwsRecordConcern
  
  string_attr :description
  string_attr :doorScreenName
  string_attr :headerImageURL
  string_attr :iconImageURL
  boolean_attr :suspended
  string_attr :suspendedAt
  string_attr :twitterScreenName
  string_attr :twitterUsername
  
  # amplifyで暗黙的に行っているパラメータ変換の処理
  #  1. CDNを付与するして画像URLをかえす
  # @note Amplify-jsは暗黙的にCDN付きURLにして保存するようなので、backend側で付与することにする。
  # @note S3に削除はしていないので、いずれS3もbackendで巻き取る
  def headerImageURL=(val)
    amplify = Rails.application.config.amplify
    s3 = Aws::S3::Client.new
    s3.copy_object(
      copy_source: ["#{amplify[:closed_s3_bucket]}/public", val].join('/'),
      bucket: amplify[:open_s3_bucket],
      key: "public/#{val}")
    @data.set_attribute(:headerImageURL, "#{amplify[:public_cdn_prefix]}#{val}")
  end

  # amplifyで暗黙的に行っているパラメータ変換の処理
  #  1. CDNを付与するして画像URLをかえす
  # @note Amplify-jsは暗黙的にCDN付きURLにして保存するようなので、backend側で付与することにする。
  # @note S3に削除はしていないので、いずれS3もbackendで巻き取る
  def iconImageURL=(val)
    amplify = Rails.application.config.amplify
    s3 = Aws::S3::Client.new
    s3.copy_object(
      copy_source: ["#{amplify[:closed_s3_bucket]}/public", val].join('/'),
      bucket: amplify[:open_s3_bucket],
      key: "public/#{val}")
    @data.set_attribute(:iconImageURL, "#{amplify[:public_cdn_prefix]}#{val}")
  end
end
