require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it 'renders index view' do
      subject
      expect(response).to render_template :index
    end
  end

  describe 'GET #weekday_menu' do
    subject { get :weekday_menu, params: {id: 0} } # Monday
  end
end
