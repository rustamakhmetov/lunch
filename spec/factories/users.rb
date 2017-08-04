FactoryGirl.define do
  sequence(:email) do |n|
    "user#{n}@test.com"
  end
  sequence(:name) do |n|
    "Name #{n}"
  end
  factory :user do
    name
    email
    password "123456789"
    confirmed_at Time.now
  end
end
