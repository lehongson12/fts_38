require "rails_helper"

RSpec.describe Question, type: :model do
  let(:question) {FactoryGirl.create :question}

  it {should validate_presence_of :content}
  it {should have_many :answers}
  it {should belong_to :user}
  it {should belong_to :category}
  it {should accept_nested_attributes_for :answers}

  context "scope" do
    it "accepted" do
      question = double("Question")
      allow(question).to receive(:state) {0}
      expect(question.state).to eq 0
    end

    it "random_questions" do
      question = double("Question")
      allow(question).to receive(:random_questions) {Settings.exam.limit_questions}
      expect(question.random_questions).to eq Settings.exam.limit_questions
    end
  end
end
