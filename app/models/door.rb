class Door < ApplicationRecord
  has_many :door_images, dependent: :destroy
  has_many :door_owners, dependent: :destroy
  has_many :door_sample_posts, dependent: :destroy
  
  # DynamoDBと完全に切り離しが終わるまで、dynamo_idを必須にしておく
  validates :dynamo_id, presence: true
  validates :title, presence: true
  validates :subscription_cost, numericality: true
  validates :member_count, numericality: { only_integer: true }
  validates :post_count, numericality: { only_integer: true }
  validates :suspended, inclusion: { in: [true, false]}
  validates :suspended_at, presence: true, if: -> { suspended == true }
  
  # @param [param] strong parameters
  def door_images=(door_image_params)
    door_image_params.each do | attributes |
      if door_image = door_images.find_or_initialize_by(order: attributes[:order])
        door_image.update!(attributes)
      end
    end
  end

  # @param [param] strong parameters
  def door_owners=(door_owner_params)
    door_owner_params.each do | attributes |
      if door_owner = door_owners.find_or_initialize_by(order: attributes[:order])
        door_owner.update!(attributes)
      end
    end
  end
end
