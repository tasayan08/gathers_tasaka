require 'test_helper'

class IventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ivents_index_url
    assert_response :success
  end

  test "should get show" do
    get ivents_show_url
    assert_response :success
  end

  test "should get edit" do
    get ivents_edit_url
    assert_response :success
  end

end
