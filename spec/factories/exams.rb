FactoryGirl.define do
  factory :exam do
    category {FactoryGirl.create :category}
    user {FactoryGirl.create :user}
    status false
  end
end
