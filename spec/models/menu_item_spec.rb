require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it { should belong_to :menu}
  it { should belong_to(:course) }
  it { should have_many(:order_items).dependent(:destroy) }
  it { should validate_presence_of :price}
end
