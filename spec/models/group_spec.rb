require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:example) do
    @user = User.create(name: 'test', email: 'test@test.com', password: '123456')
  end

  context 'Validations' do
    it 'checks for name presence' do
      group = Group.new(author: @user, icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq false
    end

    it 'checks for icon presence' do
      group = Group.new(author: @user, name: 'Travel')
      expect(group.valid?).to eq false
    end

    it 'checks for name and icon presence' do
      group = Group.new(author: @user, name: 'Travel', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq true
    end
  end

  context 'Associations' do
    it 'belongs to an author' do
      group = Group.reflect_on_association('author')
      expect(group.macro).to eq(:belongs_to)
    end

    it 'has many expenses' do
      group = Group.reflect_on_association('subjects')
      expect(group.macro).to eq(:has_many)
    end
  end
end
