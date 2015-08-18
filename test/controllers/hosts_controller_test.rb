require 'test_helper'

class HostsControllerTest < ActionController::TestCase
  setup do
    @host = hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create host" do
    assert_difference('Host.count') do
      post :create, host: { addr: @host.addr, age: @host.age, blog: @host.blog, cardtype: @host.cardtype, confpasswrd: @host.confpasswrd, destination: @host.destination, emailid: @host.emailid, food: @host.food, frequencyofCooking: @host.frequencyofCooking, idcard: @host.idcard, languages: @host.languages, lat: @host.lat, longi: @host.longi, name: @host.name, passwd: @host.passwd, phoneno: @host.phoneno, profession: @host.profession, qualification: @host.qualification, reasonToenjycooking: @host.reasonToenjycooking, toddlrReason: @host.toddlrReason, username: @host.username }
    end

    assert_redirected_to host_path(assigns(:host))
  end

  test "should show host" do
    get :show, id: @host
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @host
    assert_response :success
  end

  test "should update host" do
    patch :update, id: @host, host: { addr: @host.addr, age: @host.age, blog: @host.blog, cardtype: @host.cardtype, confpasswrd: @host.confpasswrd, destination: @host.destination, emailid: @host.emailid, food: @host.food, frequencyofCooking: @host.frequencyofCooking, idcard: @host.idcard, languages: @host.languages, lat: @host.lat, longi: @host.longi, name: @host.name, passwd: @host.passwd, phoneno: @host.phoneno, profession: @host.profession, qualification: @host.qualification, reasonToenjycooking: @host.reasonToenjycooking, toddlrReason: @host.toddlrReason, username: @host.username }
    assert_redirected_to host_path(assigns(:host))
  end

  test "should destroy host" do
    assert_difference('Host.count', -1) do
      delete :destroy, id: @host
    end

    assert_redirected_to hosts_path
  end
end
