class MessagesMailer < ApplicationMailer
  def notify_post_owner(event)
    @user = like.user
    @parent = like.post
    mail(to: @post.user.email, subject: "#{@user.full_name} liked you post")
  end
end
