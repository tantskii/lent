class RemindMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.remind_mailer.new_posts.subject
  #
  def new_posts(user)
    @email = user.email
    @posts_num = user.posts.last_six_hours.count

    @greeting = "Hi there"

    mail to: @email
  end
end
