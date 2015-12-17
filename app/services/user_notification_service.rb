class UserNotificationService
  def initialize users
    @u = users
  end

  def notify
    @u.each do |u|
      UserMailer.notifications_new_category(u.try :email?).deliver
    end
  end
end
