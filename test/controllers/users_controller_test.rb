require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { birthdate: @user.birthdate, contact_id: @user.contact_id, email: @user.email, name_f: @user.name_f, name_l: @user.name_l, name_m: @user.name_m, name_s: @user.name_s, name_t: @user.name_t, passhash: @user.passhash, salt: @user.salt, status: @user.status, unom: @user.unom }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { birthdate: @user.birthdate, contact_id: @user.contact_id, email: @user.email, name_f: @user.name_f, name_l: @user.name_l, name_m: @user.name_m, name_s: @user.name_s, name_t: @user.name_t, passhash: @user.passhash, salt: @user.salt, status: @user.status, unom: @user.unom }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
