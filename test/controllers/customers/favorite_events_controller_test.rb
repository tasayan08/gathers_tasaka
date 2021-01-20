require 'test_helper'

class Customers::FavoriteEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customers_favorite_events_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_favorite_events_destroy_url
    assert_response :success
  end

  test "should get index" do
    get customers_favorite_events_index_url
    assert_response :success
  end

end
