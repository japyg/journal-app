require "test_helper"

class CategoryCrudTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  #user story 1
  test "user should be able to create category" do 
    
    sign_in users(:usertest)
    get new_category_path
    assert_response :success

    post categories_path, params: { category: { name: "School" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "School"
  end

  #user story 2
  test "user should be able to update a category" do
    sign_in users(:usertest)
    get edit_category_path(categories(:usertest))
    assert_response :success

    patch category_path, params: { category: { name: "School-edited" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "School-edited"

  end

  #user story 3
  test "user should be able to show details of category" do
    sign_in users(:usertest)
    get category_path(categories(:usertest))
    assert_response :success
    
  end

  #delete category
  test "user should be able to delete a category" do 
    sign_in users(:usertest)
    assert_difference("Category.count", -1) do
      delete category_path(categories(:usertest))
    end 
  end
end
