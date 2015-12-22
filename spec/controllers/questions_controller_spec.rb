require "rails_helper"

RSpec.describe QuestionsController, type: :controller do

  let(:user) {FactoryGirl.create :user}
  let(:question) {FactoryGirl.create :question, user: user}

  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return user
  end

  describe "GET #index" do
    it "render index" do
      get :index, user_id: user.id
      expect(assigns(:questions)).to eq user.questions
      expect(response).to render_template :index
      expect(response).to have_http_status :ok
    end
  end

  describe "GET #new" do
    it "render new" do
      get :new, user_id: user.id
      expect(assigns(:question)).to be_a_new Question
      expect(response).to render_template :new
      expect(response).to have_http_status :ok
    end
  end

  describe "POST #create" do
    it "create" do
      post :create, user_id: user.id, question: attributes_for(:question, user: user)
      expect(assigns(:question).save).to be_truthy
      expect(response).to redirect_to user_questions_path
    end
  end

  describe "can GET #edit" do
    it "render edit" do
      get :edit , user_id: user.id, id: question.id
      expect(assigns(:question)).to eq question
      expect(response).to render_template :edit
      expect(response).to have_http_status :ok
    end
  end

  describe "can PATCH #update" do
    it "update" do
      patch :update , user_id: user.id, id: question.id,
       question: attributes_for(:question)
      expect(assigns(:question).save).to be_truthy
      expect(response.redirect?).to be_truthy
    end
  end

  describe "can DELETE #destroy" do
    it "delete" do
      delete :destroy , user_id: user.id, id: question.id,
        question: attributes_for(:question)
      expect(assigns(:question).save).to be_truthy
      expect(response.redirect?).to be_truthy
    end
  end
end
