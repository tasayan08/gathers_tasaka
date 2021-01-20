require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get circles_index" do
    get favorites_circles_index_url
    assert_response :success
  end

  test "should get events_index" do
    get favorites_events_index_url
    assert_response :success
  end

end
