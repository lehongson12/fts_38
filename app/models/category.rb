class Category < ActiveRecord::Base
  has_many :exams
  has_many :questions

  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :description, presence: true, length: {maximum: 50}
end
