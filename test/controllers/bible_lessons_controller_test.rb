require 'test_helper'

class BibleLessonsControllerTest < ActionController::TestCase
  setup do
    @bible_lesson = bible_lessons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bible_lessons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bible_lesson" do
    assert_difference('BibleLesson.count') do
      post :create, bible_lesson: { author_id: @bible_lesson.author_id, category_id: @bible_lesson.category_id, lesson: @bible_lesson.lesson, subject: @bible_lesson.subject, tags: @bible_lesson.tags, title: @bible_lesson.title }
    end

    assert_redirected_to bible_lesson_path(assigns(:bible_lesson))
  end

  test "should show bible_lesson" do
    get :show, id: @bible_lesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bible_lesson
    assert_response :success
  end

  test "should update bible_lesson" do
    patch :update, id: @bible_lesson, bible_lesson: { author_id: @bible_lesson.author_id, category_id: @bible_lesson.category_id, lesson: @bible_lesson.lesson, subject: @bible_lesson.subject, tags: @bible_lesson.tags, title: @bible_lesson.title }
    assert_redirected_to bible_lesson_path(assigns(:bible_lesson))
  end

  test "should destroy bible_lesson" do
    assert_difference('BibleLesson.count', -1) do
      delete :destroy, id: @bible_lesson
    end

    assert_redirected_to bible_lessons_path
  end
end
