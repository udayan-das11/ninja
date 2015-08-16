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
      post :create, host: { amenities: @host.amenities, card_no: @host.card_no, card_type: @host.card_type, descriptionexp: @host.descriptionexp, descriptionself: @host.descriptionself, dob: @host.dob, email-id: @host.email-id, favdestination: @host.favdestination, favmovie: @host.favmovie, favmusic: @host.favmusic, languages: @host.languages, marital_status: @host.marital_status, membership: @host.membership, name: @host.name, personalitytype: @host.personalitytype, phone: @host.phone, profession: @host.profession, qualification: @host.qualification, rating: @host.rating, socialprofile: @host.socialprofile }
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
    patch :update, id: @host, host: { amenities: @host.amenities, card_no: @host.card_no, card_type: @host.card_type, descriptionexp: @host.descriptionexp, descriptionself: @host.descriptionself, dob: @host.dob, email-id: @host.email-id, favdestination: @host.favdestination, favmovie: @host.favmovie, favmusic: @host.favmusic, languages: @host.languages, marital_status: @host.marital_status, membership: @host.membership, name: @host.name, personalitytype: @host.personalitytype, phone: @host.phone, profession: @host.profession, qualification: @host.qualification, rating: @host.rating, socialprofile: @host.socialprofile }
    assert_redirected_to host_path(assigns(:host))
  end

  test "should destroy host" do
    assert_difference('Host.count', -1) do
      delete :destroy, id: @host
    end

    assert_redirected_to hosts_path
  end
end
