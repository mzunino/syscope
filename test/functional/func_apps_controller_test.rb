require 'test_helper'

class FuncAppsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:func_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create func_app" do
    assert_difference('FuncApp.count') do
      post :create, :func_app => { }
    end

    assert_redirected_to func_app_path(assigns(:func_app))
  end

  test "should show func_app" do
    get :show, :id => func_apps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => func_apps(:one).to_param
    assert_response :success
  end

  test "should update func_app" do
    put :update, :id => func_apps(:one).to_param, :func_app => { }
    assert_redirected_to func_app_path(assigns(:func_app))
  end

  test "should destroy func_app" do
    assert_difference('FuncApp.count', -1) do
      delete :destroy, :id => func_apps(:one).to_param
    end

    assert_redirected_to func_apps_path
  end
end
