require 'test_helper'

class BibleLessonCategoriesControllerTest < ActionController::TestCase
  setup do
    @bible_lesson_category = bible_lesson_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bible_lesson_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bible_lesson_category" do
    assert_difference('BibleLessonCategory.count') do
      post :create, bible_lesson_category: { description: @bible_lesson_category.description, name: @bible_lesson_category.name }
    end

    assert_redirected_to bible_lesson_category_path(assigns(:bible_lesson_category))
  end

  test "should show bible_lesson_category" do
    get :show, id: @bible_lesson_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bible_lesson_category
    assert_response :success
  end

  test "should update bible_lesson_category" do
    patch :update, id: @bible_lesson_category, bible_lesson_category: { description: @bible_lesson_category.description, name: @bible_lesson_category.name }
    assert_redirected_to bible_lesson_category_path(assigns(:bible_lesson_category))
  end

  test "should destroy bible_lesson_category" do
    assert_difference('BibleLessonCategory.count', -1) do
      delete :destroy, id: @bible_lesson_category
    end

    assert_redirected_to bible_lesson_categories_path
  end
end
