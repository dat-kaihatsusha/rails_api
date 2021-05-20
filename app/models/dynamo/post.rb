class Dynamo::Post < Dynamo::Base
  include AwsRecordConcern
  
  string_attr :doorID
  integer_attr :commentCount
  string_attr :content
  integer_attr :deletedStatus
  integer_attr :expires
  boolean_attr :published
  string_attr :title
  list_attr :deletedImages
  list_attr :images
end