# Preview all emails at http://localhost:3000/rails/mailers/blog_subscribers_mailer
class BlogSubscribersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/blog_subscribers_mailer/email_confirmation
  def email_confirmation
    BlogSubscribersMailer.email_confirmation
  end

end
