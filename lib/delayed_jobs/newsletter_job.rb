class NewsletterJob < Struct.new(:user_id)
  def perform
    user = User.find user_id
    UserMailer.delay.exam_created_expired_time user.email
  end
end
