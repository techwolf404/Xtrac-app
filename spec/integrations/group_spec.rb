require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'test', email: 'test@mail.com', password: '123456')
      @group = Group.create(author: @user, name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
    end

    it 'checks if name is empty' do
      group = Group.new(author: @user, icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq false
    end

    it 'checks if name is present' do
      group = Group.new(author: @user, name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq true
    end

    it 'checks if icon is empty' do
      group = Group.new(author: @user, name: 'test')
      expect(group.valid?).to eq false
    end

    it 'checks if icon is present' do
      group = Group.new(author: @user, name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
      expect(group.valid?).to eq true
    end
  end
end
