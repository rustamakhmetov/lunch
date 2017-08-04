require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should validate_presence_of :name}
  it { should validate_presence_of :type}
  it { should validate_presence_of :price}
end
