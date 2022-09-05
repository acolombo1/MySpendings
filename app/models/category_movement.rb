class CategoryMovement < ApplicationRecord
  belongs_to :category
  belongs_to :movement

  validates :category_id, presence: true
  validates :movement_id, presence: true
end