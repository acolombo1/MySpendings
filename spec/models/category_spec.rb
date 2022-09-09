require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: 'My cat', author: User.first, icon: 'https://www.flaticon.com/free-icon/free-wifi_7745435?related_id=7745435&origin=pack') }

  it 'New category is valid' do
    expect(subject).to be_valid
  end

  it 'New category without icon is not valid' do
    new_cat = Category.new(name: 'My cat', author: User.first)
    expect(new_cat).to_not be_valid
  end
end
