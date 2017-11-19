require 'test_helper'

class RemindMailerTest < ActionMailer::TestCase
  test "new_posts" do
    mail = RemindMailer.new_posts
    assert_equal "New posts", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
