require 'test_helper'

class MenteesControllerTest < ActionController::TestCase
  setup do
    @mentee = mentees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mentees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mentee" do
    assert_difference('Mentee.count') do
      post :create, mentee: { bio: @mentee.bio, career_interests: @mentee.career_interests, grade: @mentee.grade, school_name: @mentee.school_name }
    end

    assert_redirected_to mentee_path(assigns(:mentee))
  end

  test "should show mentee" do
    get :show, id: @mentee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mentee
    assert_response :success
  end

  test "should update mentee" do
    patch :update, id: @mentee, mentee: { bio: @mentee.bio, career_interests: @mentee.career_interests, grade: @mentee.grade, school_name: @mentee.school_name }
    assert_redirected_to mentee_path(assigns(:mentee))
  end

  test "should destroy mentee" do
    assert_difference('Mentee.count', -1) do
      delete :destroy, id: @mentee
    end

    assert_redirected_to mentees_path
  end
end
