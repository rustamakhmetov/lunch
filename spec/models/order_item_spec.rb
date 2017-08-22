require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should belong_to :order }
  it { should belong_to :menu_item }
  it { should validate_presence_of :amount}
end
