class Category < ActiveRecord::Base
  has_many :exams
  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true,
                   reject_if: proc {|a| a[:content].blank?}
  validates :name, presence: true, length: {maximum: Settings.length.name}, uniqueness: true
  validates :description, presence: true, length: {maximum: Settings.length.description}
end
