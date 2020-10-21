require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get top_login_url
    assert_response :success
  end

end
