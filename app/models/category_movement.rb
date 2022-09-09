class CategoryMovement < ApplicationRecord
  belongs_to :category
  belongs_to :movement
  belongs_to :author, class_name: 'User'

  validates :category_id, presence: true
  validates :movement_id, presence: true
  validates :author_id, presence: true
end
