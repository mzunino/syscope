require 'test_helper'

class ContainersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:containers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create container" do
    assert_difference('Container.count') do
      post :create, :container => { }
    end

    assert_redirected_to container_path(assigns(:container))
  end

  test "should show container" do
    get :show, :id => containers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => containers(:one).to_param
    assert_response :success
  end

  test "should update container" do
    put :update, :id => containers(:one).to_param, :container => { }
    assert_redirected_to container_path(assigns(:container))
  end

  test "should destroy container" do
    assert_difference('Container.count', -1) do
      delete :destroy, :id => containers(:one).to_param
    end

    assert_redirected_to containers_path
  end
end
