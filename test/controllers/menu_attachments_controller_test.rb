require 'test_helper'

class MenuAttachmentsControllerTest < ActionController::TestCase
  setup do
    @menu_attachment = menu_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_attachment" do
    assert_difference('MenuAttachment.count') do
      post :create, menu_attachment: { avatar: @menu_attachment.avatar, menu_id: @menu_attachment.menu_id }
    end

    assert_redirected_to menu_attachment_path(assigns(:menu_attachment))
  end

  test "should show menu_attachment" do
    get :show, id: @menu_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_attachment
    assert_response :success
  end

  test "should update menu_attachment" do
    patch :update, id: @menu_attachment, menu_attachment: { avatar: @menu_attachment.avatar, menu_id: @menu_attachment.menu_id }
    assert_redirected_to menu_attachment_path(assigns(:menu_attachment))
  end

  test "should destroy menu_attachment" do
    assert_difference('MenuAttachment.count', -1) do
      delete :destroy, id: @menu_attachment
    end

    assert_redirected_to menu_attachments_path
  end
end
