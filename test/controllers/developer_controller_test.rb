require 'test_helper'

class DeveloperControllerTest < ActionController::TestCase
  test "should get clear_table" do
    get :clear_table
    assert_response :success
  end

  test "should get reset_titles" do
    get :reset_titles
    assert_response :success
  end

  test "should get reset_suffixes" do
    get :reset_suffixes
    assert_response :success
  end

  test "should get add_admin" do
    get :add_admin
    assert_response :success
  end

end
