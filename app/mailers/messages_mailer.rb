class MessagesMailer < ApplicationMailer
  def notify_parent(user, message)
    @user = user
    @message = message
    mail(to: @user.email, subject: "#{message.subject}")
  end
end
