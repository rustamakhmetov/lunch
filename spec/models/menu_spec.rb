require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should have_many(:items).dependent(:destroy)}

  it 'with new menu' do
    menu = Menu.new
    expect(menu).to receive(:fill_attributes).and_call_original
    menu.save
  end

  it 'only create one menu on day' do
    menu = create(:menu)
    expect { create(:menu) }.to raise_error ActiveRecord::RecordNotUnique
  end
end
