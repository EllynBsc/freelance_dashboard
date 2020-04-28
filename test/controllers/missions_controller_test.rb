require 'test_helper'

class MissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get missions_new_url
    assert_response :success
  end

  test "should get create" do
    get missions_create_url
    assert_response :success
  end

  test "should get edit" do
    get missions_edit_url
    assert_response :success
  end

  test "should get update" do
    get missions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get missions_destroy_url
    assert_response :success
  end

  test "should get index" do
    get missions_index_url
    assert_response :success
  end

  test "should get show" do
    get missions_show_url
    assert_response :success
  end

end
