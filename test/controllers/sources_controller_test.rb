require 'test_helper'

class SourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sources_new_url
    assert_response :success
  end

  test "should get create" do
    get sources_create_url
    assert_response :success
  end

end
