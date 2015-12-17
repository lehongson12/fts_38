class UserMailer < ApplicationMailer

  def stastic_email email
    @greeting = t "hi"

    mail to: email, subject: "FTS : Statistic exam every month"
  end

  def exam_created_expired_time email
    @greeting = t "hi"

    mail to: email, subject: "FTS : Exam created expired time"
  end

  def send_finish_exam email
    @greeting = t "hi"

    mail to: email, subject: "FTS : Finish Exam"
  end
  
  def notifications_new_category email
    @greeting = t "hi"

    mail to: email, subject: "FTS : New category"
  end
end
