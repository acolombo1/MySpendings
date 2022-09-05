class Movement < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_movements

  validates :author_id, presence: true
  validates :name, presence: true
  validates :amount, presence: true
end
