require 'test_helper'

class ContenidoProfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contenido_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contenido_profile" do
    assert_difference('ContenidoProfile.count') do
      post :create, :contenido_profile => { }
    end

    assert_redirected_to contenido_profile_path(assigns(:contenido_profile))
  end

  test "should show contenido_profile" do
    get :show, :id => contenido_profiles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contenido_profiles(:one).to_param
    assert_response :success
  end

  test "should update contenido_profile" do
    put :update, :id => contenido_profiles(:one).to_param, :contenido_profile => { }
    assert_redirected_to contenido_profile_path(assigns(:contenido_profile))
  end

  test "should destroy contenido_profile" do
    assert_difference('ContenidoProfile.count', -1) do
      delete :destroy, :id => contenido_profiles(:one).to_param
    end

    assert_redirected_to contenido_profiles_path
  end
end
