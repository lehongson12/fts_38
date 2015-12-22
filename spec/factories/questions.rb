require "faker"

FactoryGirl.define do
  factory :question do
    content {Faker::Name.name}
    user {FactoryGirl.create :user}
    category
    state 0
  end
end
