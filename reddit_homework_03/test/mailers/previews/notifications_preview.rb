# Preview all emails at http://localhost:3000/rails/mailers/notifications
class NotificationsPreview < ActionMailer::Preview
  def comments()
     Notifications.comments(Post.last,"Neki komentar").deliver_now
  end
end
