class Dynamo::Door < Dynamo::Base
  include AwsRecordConcern
  
  string_attr :title
  string_attr :stripePriceID
  integer_attr :subscriptionCost
  string_attr :subscriptionCurrency
  integer_attr :postCount
  integer_attr :memberCount
  boolean_attr :suspended
  string_attr :suspendedAt
  integer_attr :expires
end