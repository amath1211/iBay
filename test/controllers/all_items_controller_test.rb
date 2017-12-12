require 'test_helper'

class AllItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @all_item = all_items(:one)
  end

  test "should get index" do
    get all_items_url
    assert_response :success
  end

  test "should get new" do
    get new_all_item_url
    assert_response :success
  end

  test "should create all_item" do
    assert_difference('AllItem.count') do
      post all_items_url, params: { all_item: {  } }
    end

    assert_redirected_to all_item_url(AllItem.last)
  end

  test "should show all_item" do
    get all_item_url(@all_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_all_item_url(@all_item)
    assert_response :success
  end

  test "should update all_item" do
    patch all_item_url(@all_item), params: { all_item: {  } }
    assert_redirected_to all_item_url(@all_item)
  end

  test "should destroy all_item" do
    assert_difference('AllItem.count', -1) do
      delete all_item_url(@all_item)
    end

    assert_redirected_to all_items_url
  end
end
