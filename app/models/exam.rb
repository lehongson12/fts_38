class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results
  has_many :questions, through: :results

  accepts_nested_attributes_for :results
  before_save :init_questions

  scope :order_by_created_at, -> {order created_at: :DESC}

  private
  def init_questions
    @questions = category.questions.random_questions
    @questions.each {|question| results.build question: question}
  end
end
