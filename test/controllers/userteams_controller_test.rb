require 'test_helper'

class UserteamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userteams_index_url
    assert_response :success
  end

  test "should get new" do
    get userteams_new_url
    assert_response :success
  end

  test "should get destroy" do
    get userteams_destroy_url
    assert_response :success
  end

end
