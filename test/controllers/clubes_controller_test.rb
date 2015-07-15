require 'test_helper'

class ClubesControllerTest < ActionController::TestCase
  setup do
    @clube = clubes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clubes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clube" do
    assert_difference('Clube.count') do
      post :create, clube: { nome: @clube.nome }
    end

    assert_redirected_to clube_path(assigns(:clube))
  end

  test "should show clube" do
    get :show, id: @clube
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clube
    assert_response :success
  end

  test "should update clube" do
    patch :update, id: @clube, clube: { nome: @clube.nome }
    assert_redirected_to clube_path(assigns(:clube))
  end

  test "should destroy clube" do
    assert_difference('Clube.count', -1) do
      delete :destroy, id: @clube
    end

    assert_redirected_to clubes_path
  end
end
