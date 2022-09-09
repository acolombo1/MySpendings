class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_movements
  has_many :movements, -> { order 'created_at DESC' }, through: :category_movements

  validates :name, presence: true
  validates :icon, presence: true

  def total
    movements.sum(:amount)
  end
end
