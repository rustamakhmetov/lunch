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
    end

    # expect(page).to have_content 'Signed in successfully.'
    # expect(current_path).to eq root_path
  end

  # scenario 'Non-registered user try sign in' do
  #   visit new_user_session_path
  #   fill_in 'Email', with: 'wrong@yandex.ru'
  #   fill_in 'Password', with: '123456789'
  #   click_on 'Log in'
  #
  #   expect(page).to have_content 'Invalid Email or password.'
  #   expect(current_path).to eq new_user_session_path
  # end
end