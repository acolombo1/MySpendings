require 'rails_helper'

RSpec.describe CategoryMovement, type: :model do
  subject { CategoryMovement.new(category: Category.first, movement: Movement.first, author: User.first) }

  it 'New category_movement is valid' do
    expect(subject).to be_valid
  end

  it 'New category_movement is not valid without an author' do
    new_cat_mov = CategoryMovement.new(category: Category.first, movement: Movement.first)
    expect(new_cat_mov).to_not be_valid
  end
end
