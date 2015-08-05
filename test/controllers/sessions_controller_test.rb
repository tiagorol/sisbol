require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    post :create, session: {email: "joao.silva@gmail.com", password: "xyz123456"}
    assert_redirected_to root_path
  end

  test "should destroy session" do
    delete :destroy
    assert_nil  session[:user_id]
    assert_redirected_to login_path
  end

end
