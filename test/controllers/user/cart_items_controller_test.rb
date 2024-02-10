require "test_helper"

class User::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_cart_items_index_url
    assert_response :success
  end
end
