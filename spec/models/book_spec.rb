require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      book = FactoryBot.create(:book)
      expect(book.user).to be_a(User)
    end

    it 'responds to user_id' do
      book = FactoryBot.create(:book)
      expect(book).to respond_to(:user_id)
    end
  end
end
