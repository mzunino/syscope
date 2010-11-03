require 'test_helper'

class ContenidosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contenidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contenido" do
    assert_difference('Contenido.count') do
      post :create, :contenido => { }
    end

    assert_redirected_to contenido_path(assigns(:contenido))
  end

  test "should show contenido" do
    get :show, :id => contenidos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contenidos(:one).to_param
    assert_response :success
  end

  test "should update contenido" do
    put :update, :id => contenidos(:one).to_param, :contenido => { }
    assert_redirected_to contenido_path(assigns(:contenido))
  end

  test "should destroy contenido" do
    assert_difference('Contenido.count', -1) do
      delete :destroy, :id => contenidos(:one).to_param
    end

    assert_redirected_to contenidos_path
  end
end
