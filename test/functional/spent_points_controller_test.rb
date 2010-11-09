require 'test_helper'

class SpentPointsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spent_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spent_point" do
    assert_difference('SpentPoint.count') do
      post :create, :spent_point => { }
    end

    assert_redirected_to spent_point_path(assigns(:spent_point))
  end

  test "should show spent_point" do
    get :show, :id => spent_points(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => spent_points(:one).to_param
    assert_response :success
  end

  test "should update spent_point" do
    put :update, :id => spent_points(:one).to_param, :spent_point => { }
    assert_redirected_to spent_point_path(assigns(:spent_point))
  end

  test "should destroy spent_point" do
    assert_difference('SpentPoint.count', -1) do
      delete :destroy, :id => spent_points(:one).to_param
    end

    assert_redirected_to spent_points_path
  end
end
