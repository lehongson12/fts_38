class ExamsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @exams = current_user.exams.order_by_created_at
              .paginate page: params[:page], per_page: Settings.exam_page_size
    @exam = Exam.new
    @categories = Category.all
  end

  def show
  end

  def create
    @exam.user = current_user
    if @exam.save
      flash[:success] = t "exam.create.success"
    else
      flash[:danger] = t "exam.create.error"
    end
    redirect_to exams_path
  end

  def edit
  end

  def update
    if @exam.update_attributes exam_params
      redirect_to @exam
    else
      render :edit
    end
  end

  private
  def exam_params
    params.require(:exam).permit :category_id, :status, results_attributes: [:id, :answer_id]
  end
end
