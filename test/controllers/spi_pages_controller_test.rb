require 'test_helper'

class SpiPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get sonneki" do
    get sonneki_url
    assert_response :success
  end

end
