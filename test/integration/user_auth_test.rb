require "test_helper"

class UserAuthTest < ActionDispatch::IntegrationTest
  
  test "should be able to create account" do
    get new_user_registration_path
    assert_response :success

    post user_registration_path, params: {
      user: {
        email: "sample@mail.com",
        password: "123456",
        password_confirmation: "123456"
      } 
    }
    assert :redirect
    follow_redirect!
    assert_response :success
  end
end
