require "rails_helper"

RSpec.describe ExamsController, type: :controller do
  let(:exam) {create :exam}
  let(:user) {create :user}
  let(:category) {create :category}

  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return user
  end

  describe "GET #index" do
    before {get :index}
    it {expect(response).to be_success}
    it {expect(response).to render_template :index}
    it {expect(response).to have_http_status :ok}
  end

  describe "GET show" do
    it "render show" do
      get :show , id: exam
      expect(response).to render_template :show
    end
  end
end
