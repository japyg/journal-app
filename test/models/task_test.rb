require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do 
    @user = users(:usertest)
    @user.password = '123456'
  end 

  test 'should not save Task without task name' do
    # category = @user.categories.create(name: "School")
    # task = category.tasks.create(name: nil)
    task = Task.new
    assert_not task.save, "saved task without task name"

  end

end