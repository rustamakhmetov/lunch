require 'acceptance/acceptance_helper'

feature 'User on dashboard', %q{
  In order to be able to manage lunch's service from dashboard
  As an user
  I want to be able to manage lunch's service
} do

  given(:user) { create(:user)}

  describe 'Authenticate user' do
    #let!(:menu) { create(:menu) }
    let!(:menus) { {} }

    before do
      sign_in(user)
      Dashboard.dates_week(Date.today).each do |day|
        menus[day] = create(:menu_with_items, created_at: day)
      end
    end

    scenario 'see weekdays on dashboard' do
      visit root_path
      expect(page).to have_content 'Dashboard'
      Dashboard.weekdays.each do |weekday|
        expect(page).to have_link weekday
      end
    end

    scenario 'see menu', js: true do
      menu = menus[Date.today]
      visit root_path
      click_on Date.today.strftime("%A")
      wait_for_ajax
      within "div##{menu.name.downcase} .menu" do
        menu.items.each do |item|
          expect(page).to have_content(item.course.name)
          expect(page).to have_content(item.price)
        end
      end
    end

    fscenario 'select dishes from menu', js: true do
      menu = menus[Date.today]
      first_dish = menu.items.joins(:course).where("courses.kind = 0").first
      main_dish = menu.items.joins(:course).where("courses.kind = 1").first
      drink = menu.items.joins(:course).where("courses.kind = 2").first
      visit root_path
      within "div##{menu.name.downcase}" do
        click_on "order"
      end
      wait_for_ajax
      save_and_open_page
      within "div##{menu.name.downcase} .order" do
        choose first_dish
        choose main_dish
        choose drink
        # menu.items.each do |item|
        #   expect(page).to have_content(item.course.name)
        #   expect(page).to have_content(item.price)
        # end
      end
    end
  end
end

