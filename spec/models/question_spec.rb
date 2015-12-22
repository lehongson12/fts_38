require "rails_helper"

RSpec.describe Question, type: :model do
  let(:question) {FactoryGirl.create :question}

  it {should validate_presence_of :content}
  it {should have_many :answers}
  it {should belong_to :user}
  it {should belong_to :category}
  it {should accept_nested_attributes_for :answers}
end
