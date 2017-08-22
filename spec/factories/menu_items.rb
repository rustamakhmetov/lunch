FactoryGirl.define do
  factory :menu_item do
    price { rand(1.0...10.0).round(2) }

    before(:create) do |menu_item|
      menu_item.course = FactoryGirl.create(:course)
    end
  end
end
