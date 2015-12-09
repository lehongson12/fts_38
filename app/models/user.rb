class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :exams
  has_many :questions, class_name: Question.name, foreign_key: :user_id, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: {large: "900x300>", thumb: "64x64>", medium: "250x250"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  def set_default_role
    self.role ||= :user
  end
end
