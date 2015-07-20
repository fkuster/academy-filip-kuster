class Notifications < ApplicationMailer

  def comments(post,comment_content)
    @comment_content=comment_content
    if post.user.nil?
       email="#{post.creator_name}@tidder.com"
    else
       email=post.user.email
    end
    mail(to:email,subject:"#{post.title} - New comment")
  end

end
