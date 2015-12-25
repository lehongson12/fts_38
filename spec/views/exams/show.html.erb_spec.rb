require 'rails_helper'

RSpec.describe "exams/show", type: :view do
  let(:user) {FactoryGirl.create :user}
  let(:category) {FactoryGirl.create :category}
  let(:exam) {create :exam, category: category, user: user}

  before do
    sign_in user
    assign :exam, exam
    render
  end

  it "request to exams controller and show action" do
    expect(controller.request.path_parameters[:controller]).to eq "exams"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  context "exam is finished" do
    it "renders template" do
      expect(response).to render_template(:show)
    end

    it "render field" do
      expect(rendered).to have_content exam.correct_number
      expect(rendered).to have_content exam.updated_at
    end
  end
end
