require 'rails_helper'

RSpec.describe MenuController, type: :controller do
  describe 'GET #show' do
    let!(:menu) { create(:menu_with_items) }

    describe "non-authenticate user" do
      subject { get :show, params: {id: menu, format: :js  }, xhr: true }

      it 'denied access' do
        subject
        expect(response).to have_http_status(401)
      end
    end

    describe "authenticate user" do
      sign_in_user

      subject { get :show, params: {id: menu, format: :js  }, xhr: true }

      it "assigns menu to @menu" do
        subject
        expect(assigns(:menu)).to eq menu
      end

      it 'renders show view' do
        subject
        expect(response).to render_template :show
      end
    end
  end
end