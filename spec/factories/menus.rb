FactoryGirl.define do
  sequence(:price) do |n|
    n
  end

  factory :menu do
    course nil
    price "9.99"
  end
end
