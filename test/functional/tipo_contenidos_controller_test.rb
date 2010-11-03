require 'test_helper'

class TipoContenidosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_contenidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_contenido" do
    assert_difference('TipoContenido.count') do
      post :create, :tipo_contenido => { }
    end

    assert_redirected_to tipo_contenido_path(assigns(:tipo_contenido))
  end

  test "should show tipo_contenido" do
    get :show, :id => tipo_contenidos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_contenidos(:one).to_param
    assert_response :success
  end

  test "should update tipo_contenido" do
    put :update, :id => tipo_contenidos(:one).to_param, :tipo_contenido => { }
    assert_redirected_to tipo_contenido_path(assigns(:tipo_contenido))
  end

  test "should destroy tipo_contenido" do
    assert_difference('TipoContenido.count', -1) do
      delete :destroy, :id => tipo_contenidos(:one).to_param
    end

    assert_redirected_to tipo_contenidos_path
  end
end
