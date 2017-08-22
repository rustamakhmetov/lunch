require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:orders).dependent(:destroy)}
  it { should validate_presence_of :name}
  it { should validate_presence_of :email}
  it { should validate_presence_of :password}

  describe "First user is the administrator" do
    it 'tried register 1 time' do
      user = create(:user)
      expect(user.admin).to eq true
    end

    it 'tried registed 2 time' do
      users = create_list(:user, 2)
      expect(users.first.admin).to eq true
      expect(users.last.admin).to eq false
    end
  end
end
