require 'test_helper'

class ElementosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:elementos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create elemento" do
    assert_difference('Elemento.count') do
      post :create, :elemento => { }
    end

    assert_redirected_to elemento_path(assigns(:elemento))
  end

  test "should show elemento" do
    get :show, :id => elementos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => elementos(:one).to_param
    assert_response :success
  end

  test "should update elemento" do
    put :update, :id => elementos(:one).to_param, :elemento => { }
    assert_redirected_to elemento_path(assigns(:elemento))
  end

  test "should destroy elemento" do
    assert_difference('Elemento.count', -1) do
      delete :destroy, :id => elementos(:one).to_param
    end

    assert_redirected_to elementos_path
  end
end
