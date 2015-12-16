class UserMailer < ApplicationMailer

  def stastic_email email
    @greeting = t "hi"

    mail to: email, subject: t "subject_email"
  end
end
