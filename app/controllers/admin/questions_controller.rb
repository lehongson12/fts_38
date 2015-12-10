class Admin::QuestionsController < ApplicationController
  before_action :find_category
  load_and_authorize_resource 
  before_action :admin_only

  def index
    @q = @category.questions.search params[:q]
    @questions = @q.result.paginate page: params[:page], per_page: Settings.length.page
  end

  def new
    @question = Question.new
    @question.answers.build
  end

  def create
    @question = @category.questions.build question_params
    if @question.save
      flash[:success] = t "question.create.success"
      redirect_to [:admin, :category, :questions]
    else
      render :new
    end 
  end 

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      flash[:success] = t "question.update.success"
      redirect_to [:admin, :category, :questions]
    else
      flash[:danger] = t "question.update.error"
      render :edit
    end
  end

  def destroy
    @question = Question.find params[:id]
    if @question.destroy
      flash[:success] = t "question.destroy.success"
      redirect_to [:admin, :category, :questions]
    else
      flash[:danger] = t "question.destroy.error"
      redirect_to [:admin, :category, :questions]
    end
  end

  private
  def question_params
    params.require(:question).permit :content, :category_id, :state,
         answers_attributes: [:id, :content, :correct, :_destroy]
  end

  def find_category
    @category = Category.find params[:category_id]
  end

  def admin_only  
    redirect_to root_path unless current_user.try :admin?
  end
end
