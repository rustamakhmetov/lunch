require 'rails_helper'

RSpec.describe Dashboard, type: :model do
  describe ".weekdays" do
    it 'return array of days' do
      expect(Dashboard.weekdays).to match_array(%w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday})
    end
  end
end
