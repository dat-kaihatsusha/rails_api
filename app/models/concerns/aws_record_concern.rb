# Aws::Recordは継承できないので、ここで共通部分を書く
# ref. https://github.com/aws/aws-sdk-ruby-record/issues/80#issuecomment-456138855
module AwsRecordConcern
  def self.included(base)
    base.include Aws::Record
    base.set_table_name "#{base.name.demodulize}-#{Rails.application.config.dynamodb_namespace}"

    base.string_attr :id, hash_key: true
    base.datetime_attr :createdAt
    base.datetime_attr :updatedAt
  end
end