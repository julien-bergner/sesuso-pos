require 'test_helper'

class RestaurantTablesControllerTest < ActionController::TestCase
  setup do
    @restaurant_table = restaurant_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurant_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_table" do
    assert_difference('RestaurantTable.count') do
      post :create, restaurant_table: { caption: @restaurant_table.caption, number: @restaurant_table.number, restaurant_id: @restaurant_table.restaurant_id }
    end

    assert_redirected_to restaurant_table_path(assigns(:restaurant_table))
  end

  test "should show restaurant_table" do
    get :show, id: @restaurant_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_table
    assert_response :success
  end

  test "should update restaurant_table" do
    put :update, id: @restaurant_table, restaurant_table: { caption: @restaurant_table.caption, number: @restaurant_table.number, restaurant_id: @restaurant_table.restaurant_id }
    assert_redirected_to restaurant_table_path(assigns(:restaurant_table))
  end

  test "should destroy restaurant_table" do
    assert_difference('RestaurantTable.count', -1) do
      delete :destroy, id: @restaurant_table
    end

    assert_redirected_to restaurant_tables_path
  end
end
