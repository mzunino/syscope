require 'test_helper'

class AsociacionPerfilsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asociacion_perfils)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asociacion_perfil" do
    assert_difference('AsociacionPerfil.count') do
      post :create, :asociacion_perfil => { }
    end

    assert_redirected_to asociacion_perfil_path(assigns(:asociacion_perfil))
  end

  test "should show asociacion_perfil" do
    get :show, :id => asociacion_perfils(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => asociacion_perfils(:one).to_param
    assert_response :success
  end

  test "should update asociacion_perfil" do
    put :update, :id => asociacion_perfils(:one).to_param, :asociacion_perfil => { }
    assert_redirected_to asociacion_perfil_path(assigns(:asociacion_perfil))
  end

  test "should destroy asociacion_perfil" do
    assert_difference('AsociacionPerfil.count', -1) do
      delete :destroy, :id => asociacion_perfils(:one).to_param
    end

    assert_redirected_to asociacion_perfils_path
  end
end
