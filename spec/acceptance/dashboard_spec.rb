require 'acceptance/acceptance_helper'

feature 'User on dashboard', %q{
  In order to be able to manage lunch's service from dashboard
  As an user
  I want to be able to manage lunch's service
} do

  given(:user) { create(:user)}

  describe 'Authenticate user' do
    let!(:menus) { {} }

    describe "with menus" do
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

      scenario 'select dishes from menu', js: true do
        menu = menus[Date.today]
        items = menu.items.group_by {|menu_item| menu_item.course.kind}.sort.to_h
        items = Hash[items.map {|k,v| [k,v.first.course.name]}]

        first_dish = items[0]
        main_dish = items[1]
        drink = items[2]

        visit root_path
        within "div##{menu.name.downcase}" do
          click_on "order"
        end
        wait_for_ajax

        expect(page).to have_css("div##{menu.name.downcase} div.order form")
        within "div##{menu.name.downcase} div.order" do
          choose first_dish
          choose main_dish
          choose drink
          within ".first" do
            fill_in "amount", with: 2
          end
          within ".main" do
            fill_in "amount", with: 1
          end
          within ".drink" do
            fill_in "amount", with: 3
          end
          click_on "Add order"
          wait_for_ajax
        end
        expect(page).to have_content "Order was successfully created."
        expect(page).to_not have_css("div##{menu.name.downcase} div.order form")
      end
    end

    describe "without menus" do
      before do
        sign_in(user)
      end

      scenario 'see weekdays on dashboard without links' do
        visit root_path
        expect(page).to have_content 'Dashboard'
        Dashboard.weekdays.each do |weekday|
          expect(page).to_not have_link weekday
          expect(page).to have_content weekday
        end
      end
    end
  end
end

