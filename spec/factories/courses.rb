FactoryGirl.define do
  sequence(:kind) do |n|
    n % 3
  end

  factory :course do
    name
    kind
  end
end
