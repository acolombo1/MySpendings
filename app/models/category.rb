class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_movements

  validates :name, presence: true
  validates :icon, presence: true
end
