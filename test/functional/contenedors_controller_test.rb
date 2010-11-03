require 'test_helper'

class ContenedorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contenedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contenedor" do
    assert_difference('Contenedor.count') do
      post :create, :contenedor => { }
    end

    assert_redirected_to contenedor_path(assigns(:contenedor))
  end

  test "should show contenedor" do
    get :show, :id => contenedors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contenedors(:one).to_param
    assert_response :success
  end

  test "should update contenedor" do
    put :update, :id => contenedors(:one).to_param, :contenedor => { }
    assert_redirected_to contenedor_path(assigns(:contenedor))
  end

  test "should destroy contenedor" do
    assert_difference('Contenedor.count', -1) do
      delete :destroy, :id => contenedors(:one).to_param
    end

    assert_redirected_to contenedors_path
  end
end
