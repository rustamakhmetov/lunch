FactoryGirl.define do
  sequence(:price) do |n|
    n
  end

  factory :course do
    name
    type 0
    price
  end
end
