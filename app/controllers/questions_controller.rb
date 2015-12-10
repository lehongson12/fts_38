class QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @questions = current_user.questions.paginate page: params[:page], per_page: Settings.length.page
    @categories = Category.all
  end

  def show
  end

  def new
    @categories = Category.all
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.build question_params
    if @question.save
      flash[:success] = t "question.create.success"
    else
      flash[:danger] = t "question.create.error"
    end
    redirect_to [:user, :questions]
  end

  def edit
    @categories = Category.all
  end

  def update
    if @question.update_attributes question_params
      redirect_to [:user, :questions]
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find params[:id]
    if @question.destroy
      flash[:success] = t "question.destroy.success"
    else
      flash[:danger] = t "question.destroy.error"
    end
    redirect_to [:user, :questions]
  end

  private
  def question_params
    params.require(:question).permit :category_id, :content, :state,
             answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
