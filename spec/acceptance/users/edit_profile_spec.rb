require 'acceptance/acceptance_helper'

feature 'User edit profile', %q{
  In order to be able to change information in profile
  As an user
  I want to be able to edit profile
} do

  given(:user) { create(:user)}

  describe 'User try to edit profile' do
    before do
      sign_in(user)
      within ".user" do
        click_on "Edit"
      end
      expect(page).to have_content 'Edit User'
    end

    describe "with valid attributes" do
      scenario "set new name" do
        fill_in "Name", with: "new name"
        fill_in "Current password", with: user.password
        click_on "Update"
        expect(page).to have_content "Your account has been updated successfully"
        user.reload
        expect(user.name).to eq "new name"
      end

      scenario "set new email" do
        fill_in "Email", with: "new@google.com"
        fill_in "Current password", with: user.password
        click_on "Update"
        expect(page).to have_content "You updated your account successfully, but we need to verify your new email address"

        open_email('new@google.com')
        current_email.click_link 'Confirm my account'
        expect(page).to have_content 'Your email address has been successfully confirmed.'
        user.reload
        expect(user.email).to eq "new@google.com"
      end

      scenario "set new password" do
        old_password = user.encrypted_password
        new_password = "faadadffdff"
        fill_in "Password", with: new_password
        fill_in "Password confirmation", with: new_password
        fill_in "Current password", with: user.password
        click_on "Update"
        expect(page).to have_content "Your account has been updated successfully"
        user.reload
        expect(user.encrypted_password).to_not eq old_password
      end
    end

    describe "with invalid attributes" do
      scenario "set new name" do
        fill_in "Name", with: ""
        fill_in "Current password", with: user.password
        click_on "Update"
        expect(page).to have_content "Name can't be blank"
      end
    end
  end
end