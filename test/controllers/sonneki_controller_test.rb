require 'test_helper'

class SonnekiControllerTest < ActionDispatch::IntegrationTest
  test "should get q1_k" do
    get sonneki_q1_k_url
    assert_response :success
  end

  test "should get q2_k" do
    get sonneki_q2_k_url
    assert_response :success
  end

end
