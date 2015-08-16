require 'test_helper'

class ImageGallariesControllerTest < ActionController::TestCase
  setup do
    @image_gallary = image_gallaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_gallaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_gallary" do
    assert_difference('ImageGallary.count') do
      post :create, image_gallary: { Host_id: @image_gallary.Host_id, image_id: @image_gallary.image_id }
    end

    assert_redirected_to image_gallary_path(assigns(:image_gallary))
  end

  test "should show image_gallary" do
    get :show, id: @image_gallary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_gallary
    assert_response :success
  end

  test "should update image_gallary" do
    patch :update, id: @image_gallary, image_gallary: { Host_id: @image_gallary.Host_id, image_id: @image_gallary.image_id }
    assert_redirected_to image_gallary_path(assigns(:image_gallary))
  end

  test "should destroy image_gallary" do
    assert_difference('ImageGallary.count', -1) do
      delete :destroy, id: @image_gallary
    end

    assert_redirected_to image_gallaries_path
  end
end
