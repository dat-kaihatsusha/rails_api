class UserPublic < ApplicationRecord
  # DynamoDBと完全に切り離しが終わるまで、dynamo_idを必須にしておく
  validates :dynamo_id, presence: true
  validates :suspended, inclusion: { in: [true, false]}
  validates :suspended_at, presence: true, if: -> { suspended == true }
end
