require 'rails_helper'


RSpec.describe User, type: :model do
  let(:user) { create :user}
  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "has_many books" do
    user.books << Book.create(user_id: user.id, )
    expect(user).to respond_to(:books)
  end
end
