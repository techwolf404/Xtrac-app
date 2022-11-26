require 'rails_helper'

RSpec.describe Subject, type: :model do
  before(:example) do
    @user = User.create(name: 'test', email: 'test@gmail.com', password: '123456')
    @group = Group.new(author: @user, name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
  end

  context 'Validations' do
    it 'checks for name presence' do
      subject = Subject.new(author: @user, amount: 123, group_ids: [@group.id])
      expect(subject.valid?).to eq false
    end

    it 'checks for amount presence' do
      subject = Subject.new(author: @user, name: 'Nice One', group_ids: [@group.id])
      expect(subject.valid?).to eq false
    end

    context 'Associations' do
      it 'belongs to an author' do
        subject = Subject.reflect_on_association('author')
        expect(subject.macro).to eq(:belongs_to)
      end

      it 'has many categories' do
        subject = Subject.reflect_on_association('groups')
        expect(subject.macro).to eq(:has_many)
      end
    end
  end
end
