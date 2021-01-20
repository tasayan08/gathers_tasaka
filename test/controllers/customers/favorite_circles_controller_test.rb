require 'test_helper'

class Customers::FavoriteCirclesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customers_favorite_circles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_favorite_circles_destroy_url
    assert_response :success
  end

  test "should get index" do
    get customers_favorite_circles_index_url
    assert_response :success
  end

end
