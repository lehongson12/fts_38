class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :exams
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def set_default_role
    self.role ||= :user
  end
end
