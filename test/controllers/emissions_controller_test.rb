require 'test_helper'

class EmissionsControllerTest < ActionController::TestCase
  setup do
    @emission = emissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emission" do
    assert_difference('Emission.count') do
      post :create, emission: {  }
    end

    assert_redirected_to emission_path(assigns(:emission))
  end

  test "should show emission" do
    get :show, id: @emission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emission
    assert_response :success
  end

  test "should update emission" do
    patch :update, id: @emission, emission: {  }
    assert_redirected_to emission_path(assigns(:emission))
  end

  test "should destroy emission" do
    assert_difference('Emission.count', -1) do
      delete :destroy, id: @emission
    end

    assert_redirected_to emissions_path
  end
end
