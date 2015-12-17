class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform user_id
   user = User.find @user_id
   UserMailer.send_finish_exam(user.email).deliver
  end
end
