require 'test_helper'

class EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get end_users_edit_url
    assert_response :success
  end

  test "should get verification" do
    get end_users_verification_url
    assert_response :success
  end

end
