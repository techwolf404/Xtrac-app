require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'checks if name is empty' do
      user = User.new(email: 'test@gmail.com', password: '123456')
      expect(user.valid?).to eq false
    end

    it 'checks if name is present' do
      user = User.new(name: 'test', email: 'test@gmail.com', password: '123456')
      expect(user.valid?).to eq true
    end

    context 'Associations' do
      it 'has many groups' do
        user = User.reflect_on_association('groups')
        expect(user.macro).to eq(:has_many)
      end

      it 'has many expenses' do
        user = User.reflect_on_association('subjects')
        expect(user.macro).to eq(:has_many)
      end
    end
  end
end
