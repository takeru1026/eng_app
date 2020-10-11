require 'test_helper'

class AbroadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get abroads_index_url
    assert_response :success
  end

  test "should get new" do
    get abroads_new_url
    assert_response :success
  end

  test "should get create" do
    get abroads_create_url
    assert_response :success
  end

  test "should get show" do
    get abroads_show_url
    assert_response :success
  end

  test "should get edit" do
    get abroads_edit_url
    assert_response :success
  end

  test "should get update" do
    get abroads_update_url
    assert_response :success
  end

  test "should get destroy" do
    get abroads_destroy_url
    assert_response :success
  end

end
