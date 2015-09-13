require 'test_helper'

class ChangePasswordControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:one).id
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should change password" do
    post :change, change_password: {current_password: "xyz123456", new_password: "12345", confirmation_password: "12345"}
    assert_response :success
    assert_equal(User.find_by_email("joao.silva@gmail.com").password, "12345", "Nao alterou corretamente")
  end

end
