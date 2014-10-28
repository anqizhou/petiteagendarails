require 'test_helper'

class AcitivityItemsControllerTest < ActionController::TestCase
  setup do
    @acitivity_item = acitivity_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acitivity_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acitivity_item" do
    assert_difference('AcitivityItem.count') do
      post :create, acitivity_item: { activity_date: @acitivity_item.activity_date, activity_name: @acitivity_item.activity_name, activity_note: @acitivity_item.activity_note, activity_starred: @acitivity_item.activity_starred, calendar_user_id: @acitivity_item.calendar_user_id, ending_time: @acitivity_item.ending_time, starting_time: @acitivity_item.starting_time }
    end

    assert_redirected_to acitivity_item_path(assigns(:acitivity_item))
  end

  test "should show acitivity_item" do
    get :show, id: @acitivity_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acitivity_item
    assert_response :success
  end

  test "should update acitivity_item" do
    patch :update, id: @acitivity_item, acitivity_item: { activity_date: @acitivity_item.activity_date, activity_name: @acitivity_item.activity_name, activity_note: @acitivity_item.activity_note, activity_starred: @acitivity_item.activity_starred, calendar_user_id: @acitivity_item.calendar_user_id, ending_time: @acitivity_item.ending_time, starting_time: @acitivity_item.starting_time }
    assert_redirected_to acitivity_item_path(assigns(:acitivity_item))
  end

  test "should destroy acitivity_item" do
    assert_difference('AcitivityItem.count', -1) do
      delete :destroy, id: @acitivity_item
    end

    assert_redirected_to acitivity_items_path
  end
end
