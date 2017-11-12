require 'test_helper'

class MyLentControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get my_lent_show_url
    assert_response :success
  end

end
