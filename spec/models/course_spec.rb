require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:menu_items).dependent(:destroy) }
  #it { should belong_to(:menu_item) }
  it { should validate_presence_of :name}
  it { should validate_presence_of :kind}
end
