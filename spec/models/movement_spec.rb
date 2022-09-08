require 'rails_helper'

RSpec.describe Movement, type: :model do
  subject { Movement.new(name: 'McDonalds', author: User.first, amount: -60) }

  it 'New movement is valid' do
    expect(subject).to be_valid
  end

  it 'New movement is not valid without an amount' do
    new_movement = Movement.new(name: 'McDonalds', author: User.first)
    expect(new_movement).to_not be_valid
  end
end
