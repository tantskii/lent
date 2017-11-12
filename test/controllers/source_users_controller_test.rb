require 'test_helper'

class SourceUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get source_users_create_url
    assert_response :success
  end

  test "should get destroy" do
    get source_users_destroy_url
    assert_response :success
  end

end
