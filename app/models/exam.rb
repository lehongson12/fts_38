class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results
  has_many :questions, through: :results

  accepts_nested_attributes_for :results
  before_save :init_questions, unless: :is_done?
  before_update :correct_number_the_exams, :update_correct_answers, if: :is_done?

  scope :order_by_created_at, -> {order created_at: :DESC}

  private
  def init_questions
    @questions = category.questions.random_questions
    @questions.each {|question| results.build question: question}
  end

  def correct_number_the_exams
    self.correct_number = results.select{|result| result.answer.correct}.count
  end

  def update_correct_answers
    results.each{|result| result.correct = result.answer.correct unless result.answer_id.nil?}
  end

  def is_done?
    self.status?
  end
end
