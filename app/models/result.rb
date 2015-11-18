class Result < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  belongs_to :exam
end
