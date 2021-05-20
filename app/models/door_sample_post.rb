class DoorSamplePost < ApplicationRecord
  LIMIT = 3
  belongs_to :door
  
  validates :door_id, presence: true
  validates :dynamo_id, presence: true
  validates :post_created_at, presence: true
  validate :must_be_within_limit
  
  default_scope { order(post_created_at: :desc) }

  private
  # door_idに紐付くレコードを制限する
  def must_be_within_limit
    errors.add(:base, "door sample posts count limit: #{LIMIT}") if door.door_sample_posts.count >= LIMIT
  end
end
