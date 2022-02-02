require "test_helper"

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get user_id" do
    get order_user_id_url
    assert_response :success
  end

  test "should get subtotal:decima{8-2}" do
    get order_subtotal:decima{8-2}_url
    assert_response :success
  end

  test "should get tax:decimal{8-2}" do
    get order_tax:decimal{8-2}_url
    assert_response :success
  end

  test "should get total:decimal{8-2}" do
    get order_total:decimal{8-2}_url
    assert_response :success
  end
end
