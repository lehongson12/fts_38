require "faker"

FactoryGirl.define do
  factory :user do
  	name {Faker::Name.name}
  	email {Faker::Internet.email}
  	password {Faker::Internet.password 8}
  	role 0
  	factory :admin do
  		role 1
  	end
  end
end
