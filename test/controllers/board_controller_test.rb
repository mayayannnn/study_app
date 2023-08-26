require "test_helper"

class BoardControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get board_home_url
    assert_response :success
  end
end
