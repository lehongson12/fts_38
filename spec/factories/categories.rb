FactoryGirl.define do
  factory :category do
    name {Faker::Name.name}
    description {Faker::Name.name}
  end
end
