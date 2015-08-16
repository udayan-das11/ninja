require 'test_helper'

class OrderTablesControllerTest < ActionController::TestCase
  setup do
    @order_table = order_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_table" do
    assert_difference('OrderTable.count') do
      post :create, order_table: { Host_id: @order_table.Host_id, User_id: @order_table.User_id, customization: @order_table.customization, date: @order_table.date, paymentid: @order_table.paymentid, status: @order_table.status, timeslotfrom: @order_table.timeslotfrom, timeslotto: @order_table.timeslotto }
    end

    assert_redirected_to order_table_path(assigns(:order_table))
  end

  test "should show order_table" do
    get :show, id: @order_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_table
    assert_response :success
  end

  test "should update order_table" do
    patch :update, id: @order_table, order_table: { Host_id: @order_table.Host_id, User_id: @order_table.User_id, customization: @order_table.customization, date: @order_table.date, paymentid: @order_table.paymentid, status: @order_table.status, timeslotfrom: @order_table.timeslotfrom, timeslotto: @order_table.timeslotto }
    assert_redirected_to order_table_path(assigns(:order_table))
  end

  test "should destroy order_table" do
    assert_difference('OrderTable.count', -1) do
      delete :destroy, id: @order_table
    end

    assert_redirected_to order_tables_path
  end
end
