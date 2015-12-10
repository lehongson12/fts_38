class Question < ActiveRecord::Base
  
  enum state: [:pending, :accepted]
  belongs_to :category
  belongs_to :user, class_name: User.name, foreign_key: :user_id
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true, 
                                reject_if: proc {|a| a[:content].blank?}
  validates :content, presence: true, uniqueness: true
  validate :check_correct_answer

  scope :random_questions, ->{order "RANDOM() LIMIT #{Settings.exam.limit_questions}"}
  scope :accepted, ->{where state: 1}

  private
  def check_correct_answer
    errors.add :base, I18n.t("errors.not_choice_correct") if answers.select{|opt| opt.correct}.blank?
  end
end
