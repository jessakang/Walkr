require 'test_helper'

class WalkersControllerTest < ActionController::TestCase
  setup do
    @walker = walkers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:walkers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create walker" do
    assert_difference('Walker.count') do
      post :create, walker: { car: @walker.car, experience: @walker.experience, image: @walker.image, name: @walker.name, suburbs: @walker.suburbs, wage: @walker.wage }
    end

    assert_redirected_to walker_path(assigns(:walker))
  end

  test "should show walker" do
    get :show, id: @walker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @walker
    assert_response :success
  end

  test "should update walker" do
    patch :update, id: @walker, walker: { car: @walker.car, experience: @walker.experience, image: @walker.image, name: @walker.name, suburbs: @walker.suburbs, wage: @walker.wage }
    assert_redirected_to walker_path(assigns(:walker))
  end

  test "should destroy walker" do
    assert_difference('Walker.count', -1) do
      delete :destroy, id: @walker
    end

    assert_redirected_to walkers_path
  end
end
