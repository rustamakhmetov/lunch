require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it { should belong_to :menu}
  #it { should have_one(:course) }
  it { should belong_to(:course) }
  it { should validate_presence_of :price}
end
