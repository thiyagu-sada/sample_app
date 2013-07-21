FactoryGirl.define do
  factory :user do
    name     "mike"
    email    "mike@test.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

