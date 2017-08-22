require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many(:order_items).dependent(:destroy) }

  describe "create order" do
    let(:menu) { create(:menu_with_items) }
    let(:order) { create(:order)}

    it "with items" do
      expect { order.items.create(order: order,
                                  menu_item: menu.items.first,
                                  amount:1) }.to change(order.items, :count).by(1)
    end
  end
end
