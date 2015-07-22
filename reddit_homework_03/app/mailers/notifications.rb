class Notifications < ApplicationMailer

  def comments(post, comment_content)
    @comment_content = comment_content
    mail(to:post.user.email, subject:"#{post.title} - New comment")
  end

end
