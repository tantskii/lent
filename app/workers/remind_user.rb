class RemindUsers
  @queue = :lent_remind_users

  def self.perform
    User.all.each do |user|
      RemindMailer.new_posts(user).deliver_later
    end

    puts "Mails are sent #{Time.now}"
  end
end