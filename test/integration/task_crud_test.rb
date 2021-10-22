require "test_helper"

class TaskCrudTest < ActionDispatch::IntegrationTest
  #user story 4
  test "user should be able to create a task" do 
    
    get new_category_task_path(:id).task
    assert_response :success

    # post categories_path, params: { category: { name: "School" } }
    # assert_response :redirect
    # follow_redirect!
    # assert_response :success
    # assert_select "div", "School"
  end

  
end
