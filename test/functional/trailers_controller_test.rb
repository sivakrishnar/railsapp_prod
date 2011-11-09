require 'test_helper'

class TrailersControllerTest < ActionController::TestCase
  setup do
    @trailer = trailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trailer" do
    assert_difference('Trailer.count') do
      post :create, :trailer => @trailer.attributes
    end

    assert_redirected_to trailer_path(assigns(:trailer))
  end

  test "should show trailer" do
    get :show, :id => @trailer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @trailer.to_param
    assert_response :success
  end

  test "should update trailer" do
    put :update, :id => @trailer.to_param, :trailer => @trailer.attributes
    assert_redirected_to trailer_path(assigns(:trailer))
  end

  test "should destroy trailer" do
    assert_difference('Trailer.count', -1) do
      delete :destroy, :id => @trailer.to_param
    end

    assert_redirected_to trailers_path
  end
end
