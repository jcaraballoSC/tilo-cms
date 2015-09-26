require 'test_helper'

class KeyAuthsControllerTest < ActionController::TestCase
  setup do
    @key_auth = key_auths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:key_auths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key_auth" do
    assert_difference('KeyAuth.count') do
      post :create, key_auth: {  }
    end

    assert_redirected_to key_auth_path(assigns(:key_auth))
  end

  test "should show key_auth" do
    get :show, id: @key_auth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @key_auth
    assert_response :success
  end

  test "should update key_auth" do
    patch :update, id: @key_auth, key_auth: {  }
    assert_redirected_to key_auth_path(assigns(:key_auth))
  end

  test "should destroy key_auth" do
    assert_difference('KeyAuth.count', -1) do
      delete :destroy, id: @key_auth
    end

    assert_redirected_to key_auths_path
  end
end
