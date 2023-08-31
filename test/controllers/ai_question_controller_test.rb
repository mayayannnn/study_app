require "test_helper"

class AiQuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get ai_question_home_url
    assert_response :success
  end
end
