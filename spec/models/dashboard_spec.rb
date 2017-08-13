require 'rails_helper'

RSpec.describe Dashboard, type: :model do
  describe ".weekdays" do
    it 'return array of days' do
      expect(Dashboard.weekdays).to match_array(%w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday})
    end
  end

  describe ".menus" do
    let!(:menus) { {} }
    before do
      Dashboard.dates_week(Date.today).each do |day|
        menus[day] = create(:menu, created_at: day)
      end
    end

    it "return hashes of date and menu's object" do
      expect(Dashboard.menus).to include( menus )
    end
  end
end
