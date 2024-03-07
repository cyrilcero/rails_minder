require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_one)
    @category = categories(:categ_one)
    @task = tasks(:one)

    login
  end

  test "visiting the index" do
    visit root_path
    assert_text "Hello"
  end

  test "should create task" do
    visit root_path
    click_on @category.name


    # check "Completed" if @task.completed
    fill_in "Name:", with: "New Task"

    fill_in "Due Date:", with: Date.today
    click_on "Create Task"

    assert_text "Task created successfully."

  end

  test "should update Task" do
    visit root_path
    click_on @category.name

    find("a[href='#{edit_category_task_path(@category, @task)}']").click

    fill_in "Task:", with: "#{@task.name}_edited"
    fill_in "Due Date:", with: Date.today
    click_on "Update Task"

    assert_text "Task updated successfully."
  end

  test "should destroy Task" do
    visit root_path
    click_on @category.name

    del_btn = find("[data-turbo-confirm='Are you sure you want to delete this task?']")

    accept_alert do
      del_btn.click
    end
    assert_text "Task deleted successfully."
  end

  private

  def login
    visit root_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "111111"
    click_on "Login"

    assert_text "Logout"
  end
end
