# -*- coding: utf-8 -*-
require 'test_helper'

class SpiPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
    assert_select "title", "Top | SPI"
  end

  test "should get sonneki" do
    get sonneki_url
    assert_response :success
    assert_select "title", "損益算 | SPI"
  end

end
