require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe 'GET #new' do
    sign_in_user

    let!(:menu) { create(:menu_with_items) }

    before { get :new, params: { menu_id: menu.id },  format: :js, xhr: true }

    it 'assigns a new Order to @order' do
      expect(assigns(:order)).to be_a_new(Order)
    end

    it 'assigns a menu to @menu' do
      expect(assigns(:menu)).to eq menu
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    sign_in_user

    context 'with valid attributes' do
      let(:menu) { create(:menu_with_items) }
      let(:order) { create(:order) }

      subject { post :create, params: { menu_id: menu.id,
                                        order: {first: {id: menu.items[0].id, amount: 1},
                                                main:  {id: menu.items[1].id, amount: 2},
                                                drink: {id: menu.items[2].id, amount: 3 }
                                               },
                                        format: :js }
      }

      it 'saves the new order to database' do
        expect { subject  }.to change(Order, :count).by(1)
      end

      it 'current user link to the new order' do
        subject
        expect(assigns("order").user).to eq @user
      end

      it 'render template create' do
        subject
        expect(response).to render_template :create
      end
    end

    context 'with invalid attributes' do
      let(:menu) { create(:menu_with_items) }

      subject { post :create, params: { menu_id: menu.id,
                                        order: {
                                          first: nil
                                        }, format: :js } }
      it 'does not save the order' do
        expect { subject }.to_not change(Order, :count)
      end

      it "contains errors" do
        subject
        expect(assigns(:order).errors).to match_array(["Order is empty"])
      end

      it 'render template create' do
        subject
        expect(response).to render_template :create
      end
    end
  end
end