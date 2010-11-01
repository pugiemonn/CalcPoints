require 'test_helper'

class PointsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point" do
    assert_difference('Point.count') do
      post :create, :point => { }
    end

    assert_redirected_to point_path(assigns(:point))
  end

  test "should show point" do
    get :show, :id => points(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => points(:one).to_param
    assert_response :success
  end

  test "should update point" do
    put :update, :id => points(:one).to_param, :point => { }
    assert_redirected_to point_path(assigns(:point))
  end

  test "should destroy point" do
    assert_difference('Point.count', -1) do
      delete :destroy, :id => points(:one).to_param
    end

    assert_redirected_to points_path
  end
end
