require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Juancito', email: 'a@b.c', password: '123456') }

  it 'New user is valid' do
    expect(subject).to be_valid
  end

  it 'New user is not valid an email' do
    new_user = User.new(name: 'Juancito', password: '123456')
    expect(new_user).to_not be_valid
  end
end
