FactoryGirl.define do
  sequence(:price) do |n|
    n
  end

  factory :menu do
    price "9.99"

    factory :menu_with_items do
      transient do
        count 5
      end
      after :create do |menu, evaluator|
        FactoryGirl.create_list(:menu_item, evaluator.count, menu: menu)
      end
    end
  end
end
