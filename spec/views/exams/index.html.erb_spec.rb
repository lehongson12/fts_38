require "rails_helper"

RSpec.describe "exams/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create :user}
  let(:category) {FactoryGirl.create :category}
  let!(:exam) {FactoryGirl.create :exam, category: category, user: user, status: false}
  let(:exams) {user.exams.page(1)}
  let(:categories) {Category.all}

  before do
    sign_in user
    assign :category, Category.all
    assign :exam, Exam.new
    assign :exams, exams
    assign :categories, categories
    render
  end

  it "request to exams controller and index action" do
    expect(controller.request.path_parameters[:controller]).to eq "exams"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  context "render" do
    it "render exams list" do
      expect(rendered).to have_content exam.created_at
      expect(rendered).to have_content exam.category.name
      expect(rendered).to have_content exam.questions.count
      expect(rendered).to have_content exam.correct_number
    end

    it "render template in index" do
      expect(response).to render_template("exams/_exam")
    end

    it "input field" do
      expect(rendered).to have_selector "form" do |f|
        f.is_expected.to have_selector "input", name: "exam[category_id]"
        f.is_expected.to have_selector "input", name: "commit"
      end
    end
  end
end
