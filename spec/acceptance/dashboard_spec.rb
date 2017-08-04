require 'acceptance/acceptance_helper'

feature 'User on dashboard', %q{
  In order to be able to manage lunch's service from dashboard
  As an user
  I want to be able to manage lunch's service
} do

  given(:user) { create(:user)}

  describe 'Authenticate user' do
    before { sign_in(user) }

    scenario 'see weekdays on dashboard' do
      visit root_path
      expect(page).to have_content 'Dashboard'
      Dashboard.weekdays.each do |weekday|
        expect(page).to have_link weekday
      end
    end
  end
end

