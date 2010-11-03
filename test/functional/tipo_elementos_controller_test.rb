require 'test_helper'

class TipoElementosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_elementos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_elemento" do
    assert_difference('TipoElemento.count') do
      post :create, :tipo_elemento => { }
    end

    assert_redirected_to tipo_elemento_path(assigns(:tipo_elemento))
  end

  test "should show tipo_elemento" do
    get :show, :id => tipo_elementos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_elementos(:one).to_param
    assert_response :success
  end

  test "should update tipo_elemento" do
    put :update, :id => tipo_elementos(:one).to_param, :tipo_elemento => { }
    assert_redirected_to tipo_elemento_path(assigns(:tipo_elemento))
  end

  test "should destroy tipo_elemento" do
    assert_difference('TipoElemento.count', -1) do
      delete :destroy, :id => tipo_elementos(:one).to_param
    end

    assert_redirected_to tipo_elementos_path
  end
end
