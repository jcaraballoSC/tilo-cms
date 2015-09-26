require 'test_helper'

class SoftUpdatesControllerTest < ActionController::TestCase
  setup do
    @soft_update = soft_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soft_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soft_update" do
    assert_difference('SoftUpdate.count') do
      post :create, soft_update: {  }
    end

    assert_redirected_to soft_update_path(assigns(:soft_update))
  end

  test "should show soft_update" do
    get :show, id: @soft_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soft_update
    assert_response :success
  end

  test "should update soft_update" do
    patch :update, id: @soft_update, soft_update: {  }
    assert_redirected_to soft_update_path(assigns(:soft_update))
  end

  test "should destroy soft_update" do
    assert_difference('SoftUpdate.count', -1) do
      delete :destroy, id: @soft_update
    end

    assert_redirected_to soft_updates_path
  end
end
