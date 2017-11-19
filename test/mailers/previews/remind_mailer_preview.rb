# Preview all emails at http://localhost:3000/rails/mailers/remind_mailer
class RemindMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/remind_mailer/new_posts
  def new_posts
    RemindMailer.new_posts
  end

end
